import 'dart:io';
import 'dart:developer' as dev;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cloudinary_service.dart';

/// Profile model — combines Firebase Auth + Firestore extra fields.
class UserProfile {
  final String uid;
  final String displayName;
  final String email;
  final String phone;
  final String bio;
  final String photoUrl;

  const UserProfile({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.phone,
    required this.bio,
    required this.photoUrl,
  });

  factory UserProfile.fromMap(String uid, Map<String, dynamic> map) =>
      UserProfile(
        uid: uid,
        displayName: map['displayName'] as String? ?? '',
        email: map['email'] as String? ?? '',
        phone: map['phone'] as String? ?? '',
        bio: map['bio'] as String? ?? '',
        photoUrl: map['photoUrl'] as String? ?? '',
      );
}

/// Storage strategy:
///
///   READ  → Auth (instant) + SharedPreferences (instant) + Firestore bg-sync
///   WRITE → Auth (awaited) + SharedPreferences (awaited) + Firestore fire-and-forget
///
/// Firestore is NEVER awaited on the critical path, so the UI never hangs
/// even if the connection is slow or the rules haven't propagated yet.
class UserProfileService {
  static final _auth = FirebaseAuth.instance;
  static FirebaseFirestore get _db => FirebaseFirestore.instance;

  // SharedPreferences keys scoped per uid so multi-account safe
  static String _keyPhone(String uid) => 'profile_phone_$uid';
  static String _keyBio(String uid)   => 'profile_bio_$uid';

  // ── READ ────────────────────────────────────────────────────────────────────

  /// Always returns instantly:
  ///   • displayName / email / photoUrl → Firebase Auth
  ///   • phone / bio                    → SharedPreferences (local cache)
  ///
  /// Also fires a background Firestore fetch that silently updates
  /// SharedPreferences for the next time the screen opens.
  static Future<UserProfile> fetchProfile() async {
    final user = _auth.currentUser!;
    final prefs = await SharedPreferences.getInstance();

    final phone = prefs.getString(_keyPhone(user.uid)) ?? '';
    final bio   = prefs.getString(_keyBio(user.uid))   ?? '';

    // Background sync — never awaited, never throws to caller
    _syncFromFirestore(user.uid, prefs);

    return UserProfile(
      uid: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      phone: phone,
      bio: bio,
      photoUrl: user.photoURL ?? '',
    );
  }

  /// Pulls phone/bio from Firestore into SharedPreferences silently.
  static void _syncFromFirestore(String uid, SharedPreferences prefs) {
    _db
        .collection('users')
        .doc(uid)
        .get(const GetOptions(source: Source.server))
        .timeout(const Duration(seconds: 8))
        .then((doc) {
          if (doc.exists && doc.data() != null) {
            final data = doc.data()!;
            prefs.setString(_keyPhone(uid), data['phone'] as String? ?? '');
            prefs.setString(_keyBio(uid),   data['bio']   as String? ?? '');
            dev.log('[UserProfileService] Firestore sync OK');
          }
        })
        .catchError((e) {
          dev.log('[UserProfileService] Firestore sync skipped: $e');
        });
  }

  // ── WRITE ────────────────────────────────────────────────────────────────────

  /// Saves name/phone/bio.
  ///
  /// AWAITED  (critical — throws on failure):
  ///   • Firebase Auth displayName update
  ///   • SharedPreferences phone + bio
  ///
  /// FIRE-AND-FORGET (best-effort — never throws to caller):
  ///   • Firestore document merge
  static Future<void> saveProfile({
    required String displayName,
    required String phone,
    required String bio,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('No authenticated user');

    // ── Critical writes ────────────────────────────────────────────────────
    await user.updateDisplayName(displayName);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPhone(user.uid), phone);
    await prefs.setString(_keyBio(user.uid),   bio);

    // ── Background Firestore write ─────────────────────────────────────────
    _writeToFirestore(uid: user.uid, data: {
      'displayName': displayName,
      'email': user.email ?? '',
      'phone': phone,
      'bio': bio,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Uploads photo to Cloudinary, then updates Firebase Auth photoURL.
  /// Firestore URL write is fire-and-forget.
  static Future<String> uploadAndSavePhoto(File imageFile) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('No authenticated user');

    // Upload to Cloudinary — throws CloudinaryUploadException on failure
    final imageUrl = await CloudinaryService.uploadImage(
      imageFile,
      publicId: 'orc_app/avatars/${user.uid}',
    );

    // ── Critical write ─────────────────────────────────────────────────────
    await user.updatePhotoURL(imageUrl);

    // ── Background Firestore write ─────────────────────────────────────────
    _writeToFirestore(uid: user.uid, data: {
      'photoUrl': imageUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    return imageUrl;
  }

  /// Orchestrates photo upload (optional) + text field save.
  /// Returns the final photo URL.
  static Future<String> updateProfile({
    required String displayName,
    required String phone,
    required String bio,
    File? newImageFile,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('No authenticated user');

    String photoUrl = user.photoURL ?? '';

    if (newImageFile != null) {
      photoUrl = await uploadAndSavePhoto(newImageFile);
    }

    await saveProfile(displayName: displayName, phone: phone, bio: bio);

    return photoUrl;
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

  /// Writes to Firestore in the background. Never awaited, never throws.
  static void _writeToFirestore({
    required String uid,
    required Map<String, dynamic> data,
  }) {
    _db
        .collection('users')
        .doc(uid)
        .set(data, SetOptions(merge: true))
        .timeout(const Duration(seconds: 8))
        .then((_) => dev.log('[UserProfileService] Firestore write OK'))
        .catchError((e) => dev.log('[UserProfileService] Firestore write skipped: $e'));
  }
}
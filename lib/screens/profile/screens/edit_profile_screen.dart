import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orc_app/screens/profile/services/cloudinary_service.dart';
import 'package:orc_app/screens/profile/services/user_profile_service.dart';
import 'package:orc_app/theme/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey         = GlobalKey<FormState>();
  final _nameController  = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController   = TextEditingController();

  bool         _isSaving         = false;
  bool         _isLoadingProfile = true;
  File?        _pickedImage;
  String       _currentPhotoUrl  = '';
  _UploadState _uploadState      = _UploadState.idle;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  // ── Load profile ────────────────────────────────────────────────────────────
  // fetchProfile() is non-nullable and returns instantly from Auth +
  // SharedPreferences. It also fires a background Firestore sync.

  Future<void> _loadProfile() async {
    // Seed immediately from Auth so fields are never blank
    final user = FirebaseAuth.instance.currentUser;
    _nameController.text = user?.displayName ?? '';
    _currentPhotoUrl     = user?.photoURL ?? '';

    try {
      final profile = await UserProfileService.fetchProfile();
      if (mounted) {
        if (profile.displayName.isNotEmpty) {
          _nameController.text = profile.displayName;
        }
        _phoneController.text = profile.phone;
        _bioController.text   = profile.bio;
        if (profile.photoUrl.isNotEmpty) {
          _currentPhotoUrl = profile.photoUrl;
        }
      }
    } catch (_) {
      // Auth fallback already applied — screen is always usable
    } finally {
      if (mounted) setState(() => _isLoadingProfile = false);
    }
  }

  // ── Image picker ────────────────────────────────────────────────────────────

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 800,
    );
    if (picked != null && mounted) {
      setState(() => _pickedImage = File(picked.path));
    }
  }

  // ── Save ────────────────────────────────────────────────────────────────────

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving    = true;
      _uploadState = _pickedImage != null
          ? _UploadState.uploading
          : _UploadState.saving;
    });

    try {
      await UserProfileService.updateProfile(
        displayName:  _nameController.text.trim(),
        phone:        _phoneController.text.trim(),
        bio:          _bioController.text.trim(),
        newImageFile: _pickedImage,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: AppTheme.forestGreen,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context, true);
      }
    } on CloudinaryUploadException catch (e) {
      _showError('Image upload failed. Check your internet connection.\n${e.message}');
    } catch (e) {
      _showError('Could not save profile: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() {
          _isSaving    = false;
          _uploadState = _UploadState.idle;
        });
      }
    }
  }

  void _showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppTheme.charcoal,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: AppTheme.charcoal,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isSaving ? null : _saveChanges,
            child: _isSaving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppTheme.forestGreen,
                    ),
                  )
                : const Text(
                    'Save',
                    style: TextStyle(
                      color: AppTheme.forestGreen,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _isLoadingProfile
          ? const Center(
              child: CircularProgressIndicator(color: AppTheme.forestGreen),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // ── Avatar picker ──────────────────────────────────────
                    GestureDetector(
                      onTap: _isSaving ? null : _pickImage,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 52,
                            backgroundColor: AppTheme.forestGreen,
                            backgroundImage: _pickedImage != null
                                ? FileImage(_pickedImage!) as ImageProvider
                                : (_currentPhotoUrl.isNotEmpty
                                    ? NetworkImage(_currentPhotoUrl)
                                    : null),
                            child: (_pickedImage == null &&
                                    _currentPhotoUrl.isEmpty)
                                ? Text(
                                    (user?.displayName ?? 'U')[0].toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),

                          // Upload overlay
                          if (_uploadState == _UploadState.uploading)
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.5,
                                  ),
                                ),
                              ),
                            ),

                          // Camera / check badge
                          if (_uploadState != _UploadState.uploading)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: _pickedImage != null
                                      ? Colors.orange
                                      : AppTheme.forestGreen,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2),
                                ),
                                child: Icon(
                                  _pickedImage != null
                                      ? Icons.check
                                      : Icons.camera_alt,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _pickedImage != null
                          ? 'New photo selected — tap Save to upload'
                          : 'Tap to change photo',
                      style: TextStyle(
                        fontSize: 12,
                        color: _pickedImage != null
                            ? Colors.orange.shade700
                            : AppTheme.softGray,
                        fontWeight: _pickedImage != null
                            ? FontWeight.w500
                            : FontWeight.normal,
                      ),
                    ),

                    // Status banner
                    if (_uploadState != _UploadState.idle) ...[
                      const SizedBox(height: 12),
                      _UploadBanner(state: _uploadState),
                    ],

                    const SizedBox(height: 28),

                    // ── Personal info ──────────────────────────────────────
                    _FieldSection(
                      label: 'Personal Info',
                      children: [
                        _FormField(
                          controller: _nameController,
                          label: 'Full Name',
                          icon: Icons.person_outline,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty)
                                  ? 'Name is required'
                                  : null,
                        ),
                        _FormField(
                          controller: _phoneController,
                          label: 'Phone Number',
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ── About ──────────────────────────────────────────────
                    _FieldSection(
                      label: 'About',
                      children: [
                        _FormField(
                          controller: _bioController,
                          label: 'Bio',
                          icon: Icons.edit_note_outlined,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // ── Email (read-only) ──────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.email_outlined,
                                color: AppTheme.softGray, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: AppTheme.softGray,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    user?.email ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppTheme.charcoal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.forestGreen.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Verified',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppTheme.forestGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
    );
  }
}

// ── Enums & sub-widgets ──────────────────────────────────────────────────────

enum _UploadState { idle, uploading, saving }

class _UploadBanner extends StatelessWidget {
  final _UploadState state;
  const _UploadBanner({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.forestGreen.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppTheme.forestGreen.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.forestGreen,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              state == _UploadState.uploading
                  ? 'Uploading photo to Cloudinary...'
                  : 'Saving profile...',
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.forestGreen,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FieldSection extends StatelessWidget {
  final String label;
  final List<Widget> children;
  const _FieldSection({required this.label, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppTheme.softGray,
                letterSpacing: 0.6,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: children
                  .asMap()
                  .entries
                  .map((e) => Column(
                        children: [
                          e.value,
                          if (e.key < children.length - 1)
                            const Divider(
                                height: 1, indent: 48, endIndent: 16),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Icon(icon, color: AppTheme.softGray, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              validator: validator,
              style: const TextStyle(
                  fontSize: 14, color: AppTheme.charcoal),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(
                    color: AppTheme.softGray, fontSize: 13),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
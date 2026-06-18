import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Uploads images to Cloudinary using an **unsigned upload preset**.
///
/// Setup (one-time in Cloudinary dashboard):
///   1. Settings → Upload → Upload presets → Add upload preset
///   2. Set "Signing Mode" to **Unsigned**
///   3. Optionally set folder to "orc_app/avatars"
///   4. Copy the preset name into [uploadPreset] below.
///   5. Copy your Cloud Name into [cloudName] below.
class CloudinaryService {
  // ─── CONFIG — replace with your actual values ───────────────────────────
  static const String cloudName   = 'YOUR_CLOUD_NAME';    // e.g. 'dxyz1234'
  static const String uploadPreset = 'YOUR_UPLOAD_PRESET'; // e.g. 'orc_app_avatars'
  // ────────────────────────────────────────────────────────────────────────

  static const String _baseUrl =
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

  /// Uploads [imageFile] to Cloudinary and returns the secure HTTPS URL.
  ///
  /// [publicId] is optional — if supplied the image will overwrite any
  /// previously uploaded file with the same id (great for per-user avatars).
  ///
  /// Throws a [CloudinaryUploadException] on failure.
  static Future<String> uploadImage(
    File imageFile, {
    String? publicId,
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(_baseUrl));

    request.fields['upload_preset'] = uploadPreset;
    if (publicId != null) request.fields['public_id'] = publicId;

    request.files.add(
      await http.MultipartFile.fromPath('file', imageFile.path),
    );

    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();

    if (streamedResponse.statusCode != 200) {
      throw CloudinaryUploadException(
        'Upload failed (${streamedResponse.statusCode}): $responseBody',
      );
    }

    final json = jsonDecode(responseBody) as Map<String, dynamic>;
    final secureUrl = json['secure_url'] as String?;

    if (secureUrl == null) {
      throw CloudinaryUploadException('No secure_url in response: $responseBody');
    }

    return secureUrl;
  }
}

class CloudinaryUploadException implements Exception {
  final String message;
  const CloudinaryUploadException(this.message);

  @override
  String toString() => 'CloudinaryUploadException: $message';
}
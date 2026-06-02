// File generated based on google-services.json
// Project: orc-susl | Package: com.example.orc_app

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Web is not configured. Add Firebase web config to use on web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'iOS is not configured. Add GoogleService-Info.plist to use on iOS.',
        );
      default:
        throw UnsupportedError(
          'Unsupported platform: $defaultTargetPlatform',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAE00VLmfoXjP6xQVpsJAoM3A0YB_jZG54',
    appId: '1:1000828055417:android:163e0f4ea1b133461c49a8',
    messagingSenderId: '1000828055417',
    projectId: 'orc-susl',
    storageBucket: 'orc-susl.firebasestorage.app',
  );
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const ORCApp());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp().timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        debugPrint('Firebase init timed out');
        throw Exception('Firebase initialization timed out');
      },
    );
    debugPrint('Firebase initialized successfully');
  } on FirebaseException catch (e) {
    debugPrint('FirebaseException: ${e.code} — ${e.message}');
  } catch (e) {
    debugPrint('Firebase init failed: $e');
  }
}

class ORCApp extends StatelessWidget {
  const ORCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ORC SUSL',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
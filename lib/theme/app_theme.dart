import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color forestGreen = Color(0xFF2D6A4F);
  static const Color deepGreen   = Color(0xFF1B4332);
  static const Color lightGreen  = Color(0xFF74C69D);
  static const Color accentGold  = Color(0xFFD4A017);
  static const Color skyBlue     = Color(0xFF48CAE4);
  static const Color warmWhite   = Color(0xFFF8F9FA);
  static const Color charcoal    = Color(0xFF2D3436);
  static const Color softGray    = Color(0xFF636E72);
  static const Color cardWhite   = Color(0xFFFFFFFF);

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: forestGreen,
      primary: forestGreen,
      secondary: lightGreen,
      surface: warmWhite,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: warmWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: charcoal),
      titleTextStyle: TextStyle(
        color: charcoal,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: forestGreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: forestGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}

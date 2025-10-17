import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  static const Color primary = Color(0xFF0057FF);
  static const Color secondary = Color(0xFF00C2FF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF757575);
}

final appTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: AppColors.textPrimary),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  useMaterial3: true,
);
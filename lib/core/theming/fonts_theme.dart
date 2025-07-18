import 'package:drippydrop_app/core/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textLight,
    ),
    displayMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textLight,
    ),
    displaySmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textLight,
    ),
    headlineMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textLight,
    ),
    headlineSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textLight,
    ),
    titleLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textLight,
    ),
    titleMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textLight,
    ),
    titleSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textLight,
    ),
    bodyLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textLight,
    ),
    bodyMedium: GoogleFonts.gabarito(
      color: AppColors.textLight,
    ),
    bodySmall: GoogleFonts.gabarito(
      color: AppColors.textLight,
    ),
    labelLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w400,
      color: AppColors.hintLight,
    ),
    labelMedium: GoogleFonts.gabarito(
      color: AppColors.hintLight,
    ),
    labelSmall: GoogleFonts.gabarito(
      color: AppColors.hintLight,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    displayMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    displaySmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.bold,
      color: AppColors.textDark,
    ),
    headlineMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    headlineSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    titleLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w600,
      color: AppColors.textDark,
    ),
    titleMedium: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    titleSmall: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    bodyLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w500,
      color: AppColors.textDark,
    ),
    bodyMedium: GoogleFonts.gabarito(
      color: AppColors.textDark,
    ),
    bodySmall: GoogleFonts.gabarito(
      color: AppColors.textDark,
    ),
    labelLarge: GoogleFonts.gabarito(
      fontWeight: FontWeight.w400,
      color: AppColors.hintDark,
    ),
    labelMedium: GoogleFonts.gabarito(
      color: AppColors.hintDark,
    ),
    labelSmall: GoogleFonts.gabarito(
      color: AppColors.hintDark,
    ),
  );
}

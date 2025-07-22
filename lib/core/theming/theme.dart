import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/color.dart';
import 'fonts_theme.dart' show AppTypography;

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.surfaceLight,
    onSecondary: AppColors.textLight,
    background: AppColors.backgroundLight,
    onBackground: AppColors.textLight,
    surface: AppColors.surfaceLight,
    onPrimaryContainer: AppColors.hintLight,
    onSurface: AppColors.textLight,
    error: Colors.red,
    onError: Colors.white,
  ),
  textTheme: GoogleFonts.gabaritoTextTheme(AppTypography.lightTextTheme),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surfaceLight,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),
    labelStyle: AppTypography.lightTextTheme.bodyMedium,
    hintStyle: AppTypography.lightTextTheme.labelLarge?.copyWith(
      color: AppColors.hintLight,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      textStyle: AppTypography.lightTextTheme.bodyLarge?.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      minimumSize: Size(double.infinity, 56.h),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.backgroundLight,
    secondary: AppColors.second,
    onSecondary: AppColors.textDark,
    background: AppColors.backgroundDark,
    onPrimaryContainer: AppColors.hintDark,
    onBackground: AppColors.textDark,
    surface: AppColors.second,
    onSurface: AppColors.textDark,
    error: Colors.redAccent,
    onError: Colors.black,
  ),
  textTheme: GoogleFonts.gabaritoTextTheme(AppTypography.darkTextTheme),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.second,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: AppColors.primary, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
    ),
    labelStyle: AppTypography.darkTextTheme.bodyMedium,
    hintStyle: AppTypography.darkTextTheme.labelLarge?.copyWith(
      color: AppColors.hintDark,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      textStyle: AppTypography.darkTextTheme.bodyLarge?.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      minimumSize: Size(double.infinity, 56.h),
    ),
  ),
);

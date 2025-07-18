import 'package:drippydrop_app/core/animations/snackbar_animation.dart';
import 'package:drippydrop_app/core/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle sp(double size) => copyWith(fontSize: size.sp);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle weight(FontWeight weight) => copyWith(fontWeight: weight);
}

extension PaddingExtensions on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get h => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get v => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get top => EdgeInsets.only(top: this);

  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  EdgeInsets get left => EdgeInsets.only(left: this);

  EdgeInsets get right => EdgeInsets.only(right: this);
}

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  Color get primaryColor => colorScheme.primary;

  Color get secondaryColor => colorScheme.secondary;

  Color get backgroundColor => colorScheme.background;

  Color get surfaceColor => colorScheme.surface;

  Color get errorColor => colorScheme.error;

  Brightness get brightness => theme.brightness;

  bool get isDarkMode => brightness == Brightness.dark;

  Color get hintColor => isDarkMode ? AppColors.hintDark : AppColors.hintLight;

  Color get textColor => isDarkMode ? AppColors.textDark : AppColors.textLight;
}

extension Navigation on BuildContext {
  /// الانتقال إلى شاشة جديدة مع إمكانية الرجوع
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// الانتقال إلى شاشة جديدة مع استبدال الشاشة الحالية
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// الانتقال إلى شاشة جديدة وإزالة جميع الشاشات السابقة
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  /// الانتقال إلى شاشة جديدة مع إمكانية الحصول على نتيجة عند الرجوع
  Future<dynamic> pushNamedForResult(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// استبدال الشاشة الحالية بشاشة جديدة مع إمكانية الحصول على نتيجة عند الرجوع
  Future<dynamic> pushReplacementNamedForResult(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// الانتقال إلى شاشة جديدة مع إزالة الشاشات السابقة حتى شاشة معينة
  Future<dynamic> pushNamedAndRemoveUntilPredicate(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// الرجوع إلى الشاشة السابقة
  void pop([dynamic result]) {
    Navigator.of(this).pop(result);
  }

  /// الرجوع حتى يتم استيفاء شرط معين
  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }
}

extension BuildContextSnackBarExtension on BuildContext {
  void showAppSnackBar(
    String message, {
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Duration duration = const Duration(seconds: 5),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    bool isError = false,
    bool isSuccess = false,
  }) {
    Color effectiveBackgroundColor;
    if (isError) {
      effectiveBackgroundColor = Colors.red.shade700;
    } else if (isSuccess) {
      effectiveBackgroundColor = Colors.green.shade700;
    } else {
      effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: AnimatedSnackBar(
          message: message,
          backgroundColor: effectiveBackgroundColor,
          textColor: textColor,
          icon: icon,
          behavior: behavior,
          margin: margin,
        ),
        behavior: behavior,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin:
            margin ?? EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
        duration: duration,
      ),
    );
  }
}

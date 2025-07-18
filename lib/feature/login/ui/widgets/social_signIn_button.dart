import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget socialSignInButton({
  required BuildContext context,
  required IconData icon,
  required String text,
  required double size,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final textTheme = theme.textTheme;
  return SizedBox(
    width: double.infinity,
    height: 50.h,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        side: BorderSide.none,

        padding: EdgeInsets.symmetric(horizontal: 16.w),
        backgroundColor: colorScheme.secondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: size.sp, color: context.colorScheme.onBackground),
          SizedBox(width: 60.w),
          Text(
            text,
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

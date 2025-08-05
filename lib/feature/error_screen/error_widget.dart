import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorScreen extends StatelessWidget {
  final String message;

  const CustomErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 80.sp, color: colorScheme.error),
              verticalSpace(20),
              Text(
                "Oops! Something went wrong",
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              verticalSpace(12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: colorScheme.onSecondary,
                ),
              ),
              verticalSpace(30),
              ElevatedButton.icon(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Go Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

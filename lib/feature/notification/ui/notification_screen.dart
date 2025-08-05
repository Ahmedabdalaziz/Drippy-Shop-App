import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
        backgroundColor: context.colorScheme.background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/notification/bell.png",
              height: 100.h,
              width: 100.w,
            ),
            verticalSpace(24),
            Text(
              "No Notification yet",
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

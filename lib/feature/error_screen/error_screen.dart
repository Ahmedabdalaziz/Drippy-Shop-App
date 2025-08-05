import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Get Out Of here!",
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

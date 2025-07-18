import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/widgets/block_back.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackBlocker(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Welcome Home", style: context.textTheme.titleLarge),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:drippydrop_app/core/helper/color.dart';
import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/token.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print("===== Splash Screen Loaded =====");
    checkAndNavigate();
  }

  void checkAndNavigate() async {
    final token = await TokenManager().getToken();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      if (token != null && token.isNotEmpty) {
        context.pushNamedAndRemoveUntil(Routing.signup);
      } else {
        context.pushNamedAndRemoveUntil(Routing.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Drippy Drop",
              style: context.textTheme.displayLarge?.withColor(
                AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

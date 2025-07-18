import 'package:drippydrop_app/core/helper/color.dart';
import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';

import '../logic/check_and_refresh_session.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAndNavigate();
  }

  void checkAndNavigate() async {
    final isLoggedIn = await checkAndRefreshSession();
    if (isLoggedIn) {
      Future.delayed(Duration(seconds: 3), () {
        context.pushNamedAndRemoveUntil(Routing.home);
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        context.pushNamedAndRemoveUntil(Routing.login);
      });
    }
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

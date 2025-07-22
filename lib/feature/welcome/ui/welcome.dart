import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double _scale = 0.0;
  bool active = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _scale = 1.0;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        active = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedScale(
            scale: _scale,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOutBack,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/welcome/welcome.svg",
                  height: 300.h,
                  width: 300.w,
                ),
                verticalSpace(24.h),
                Text(
                  "Welcome to DrippyDrop",
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 32.h),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(24.h),
                SizedBox(
                  height: 100.h,
                  child: AnimatedOpacity(
                    opacity: active ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: Padding(
                      padding: 16.0.all,
                      child: ElevatedButton(
                        onPressed: active
                            ? () {
                                context.pushNamedAndRemoveUntil(Routing.home);
                              }
                            : null,
                        child: Text(
                          "Get Started",
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

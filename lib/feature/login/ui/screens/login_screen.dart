import 'package:drippydrop_app/core/helper/color.dart';
import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/functions.dart' show Validators;
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:drippydrop_app/feature/login/logic/login_cubit.dart';
import 'package:drippydrop_app/feature/login/ui/widgets/social_signIn_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/block_back.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    print("===== Login Screen Loaded =====");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          context.showAppSnackBar(
            'Logging in...',
            backgroundColor: context.colorScheme.primary,
            icon: FontAwesomeIcons.infoCircle,
            duration: const Duration(seconds: 2),
          );
        } else if (state is LoginSuccess) {
          FocusScope.of(context).unfocus();
          context.pushNamed(Routing.navigator);
        } else if (state is LoginError) {
          context.showAppSnackBar(
            state.error,
            isError: true,
            icon: FontAwesomeIcons.circleExclamation,
          );
        }
      },
      child: BackBlocker(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.only(
                  top: statusBarHeight + 110.h,
                  left: 23.w,
                  right: 23.w,
                  bottom: MediaQuery.of(context).viewInsets.bottom > 0
                      ? MediaQuery.of(context).viewInsets.bottom + 20.h
                      : 0.h,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign in",
                        style: context.textTheme.displayLarge?.copyWith(
                          fontSize: 32.sp,
                          color: context.textColor,
                        ),
                      ),
                      verticalSpace(36),
                      TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.textColor,
                        ),
                        validator: Validators.validateEmail,
                      ),
                      verticalSpace(18),
                      TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                            child: Icon(
                              obscurePassword
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              color: context.textColor,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: obscurePassword,
                        controller: _passwordController,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.textColor,
                        ),
                        validator: Validators.isEmpty,
                      ),
                      verticalSpace(18),
                      ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().loginUser(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                          } else {
                            context.showAppSnackBar(
                              'Please review the data entered.',
                              isError: true,
                              icon: FontAwesomeIcons.circleExclamation,
                            );
                          }
                        },
                        child: const Text("Continue"),
                      ),
                      verticalSpace(18),
                      Row(
                        children: [
                          Text(
                            "Forget Password? ",
                            style: context.textTheme.labelSmall?.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "Reset",
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 15.sp,
                              color: context.textColor,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(58),
                      socialSignInButton(
                        onPressed: () {
                          context.showAppSnackBar(
                            "This Feature Will be Available Soon",
                            backgroundColor: AppColors.yellow,
                            icon: FontAwesomeIcons.personWalkingWithCane,
                          );
                        },
                        size: 28,
                        context: context,
                        icon: FontAwesomeIcons.apple,
                        text: 'Continue With Apple',
                      ),
                      verticalSpace(18),
                      socialSignInButton(
                        size: 24,
                        context: context,
                        icon: FontAwesomeIcons.google,
                        text: 'Continue With Google',
                        onPressed: () {
                          context.showAppSnackBar(
                            "This Feature Will be Available Soon",
                            backgroundColor: AppColors.yellow,
                            icon: FontAwesomeIcons.personWalkingWithCane,
                          );
                        },
                      ),
                      verticalSpace(18),
                      socialSignInButton(
                        onPressed: () {
                          context.showAppSnackBar(
                            "This Feature Will be Available Soon",
                            backgroundColor: AppColors.yellow,
                            icon: FontAwesomeIcons.personWalkingWithCane,
                          );
                        },
                        size: 24,
                        context: context,
                        icon: FontAwesomeIcons.facebook,
                        text: 'Continue With Facebook',
                      ),
                      verticalSpace(68),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an Account? ",
                            style: context.textTheme.labelSmall?.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              context.pushNamed(Routing.signup);
                            },
                            child: Text(
                              "Create One",
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 15.sp,
                                color: context.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
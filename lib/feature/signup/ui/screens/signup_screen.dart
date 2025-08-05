import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/functions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FontAwesomeIcons;

import '../../../../core/routing/routs.dart';
import '../../logic/signup_cubit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          context.showAppSnackBar(
            state.error,
            isError: true,
            icon: FontAwesomeIcons.circleExclamation,
          );
        } else if (state is SignupSuccess) {
          context.showAppSnackBar(
            'Account created successfully!',
            isSuccess: true,
            isError: false,
            icon: FontAwesomeIcons.circleCheck,
          );
          context.pushNamedAndRemoveUntil(Routing.ageAndGender);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: statusBarHeight + 40.h,
                      left: 23.w,
                      right: 23.w,
                      bottom: MediaQuery.of(context).viewInsets.bottom > 0
                          ? MediaQuery.of(context).viewInsets.bottom + 20.h
                          : 0.h,
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: Icon(
                              Icons.keyboard_arrow_left,
                              color: context.colorScheme.onSecondary,
                              size: 26.sp,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor: context
                                  .colorScheme
                                  .onPrimaryContainer
                                  .withOpacity(0.2),
                              shape: const CircleBorder(),
                            ),
                          ),
                          verticalSpace(22),
                          Text(
                            'Create Account',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 32.sp,
                              color: context.textColor,
                            ),
                          ),
                          verticalSpace(26),

                          /// Name
                          TextFormField(
                            decoration: const InputDecoration(hintText: 'Name'),
                            controller: name,
                            validator: (val) => val == null || val.isEmpty
                                ? 'Please enter your name'
                                : null,
                          ),
                          verticalSpace(18),

                          /// Email
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email Address',
                            ),
                            controller: emailController,
                            validator: Validators.validateEmail,
                          ),
                          verticalSpace(18),

                          /// Phone
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                            ),
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: Validators.validatePhone,
                          ),
                          verticalSpace(18),

                          /// Password
                          TextFormField(
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
                            obscureText: obscurePassword,
                            controller: passwordController,
                            validator: Validators.validatePassword,
                          ),
                          verticalSpace(58),

                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<SignupCubit>().signupUser(
                                  name: name.text,
                                  email: emailController.text,
                                  password: passwordController.text.trim(),
                                );
                              } else {
                                context.showAppSnackBar(
                                  'Please review the data entered.',
                                  isError: true,
                                  icon: FontAwesomeIcons.circleExclamation,
                                );
                              }
                            },
                            child: const Text('Continue'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state is SignupLoading)
                Container(
                  color: context.colorScheme.onSecondary.withOpacity(0.4),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
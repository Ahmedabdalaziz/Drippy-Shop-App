import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../logic/signup_cubit.dart';

// Import your SignupCubit here
// import 'package:drippydrop_app/feature/signup/cubit/signup_cubit.dart';

class AgeAndGenderScreen extends StatefulWidget {
  const AgeAndGenderScreen({super.key});

  @override
  State<AgeAndGenderScreen> createState() => _AgeAndGenderScreenState();
}

class _AgeAndGenderScreenState extends State<AgeAndGenderScreen> {
  String? selectedGender;
  String? selectedAge;

  final List<String> ageRanges = [
    'Under 18',
    '18-24', 
    '25-34', 
    '35-44',
    '45-54',
    '55-64',
    '65+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is GenderAgeSuccess) {
              // Navigate to home after successful update
              context.pushNamedAndRemoveUntil(Routing.home);
            } else if (state is GenderAgeError) {
              // Show error message
              context.showAppSnackBar(
                state.error,
                isError: true,
                icon: FontAwesomeIcons.circleExclamation,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is GenderAgeLoading;

            return Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 160.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tell us About yourself",
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpace(56),
                  Text(
                    "Who do you shop for ?",
                    style: context.textTheme.titleMedium,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: isLoading ? null : () {
                            setState(() => selectedGender = 'Male');
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedGender == 'Male'
                                  ? context.colorScheme.primary
                                  : context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Male',
                                style: TextStyle(
                                  color: selectedGender == 'Male'
                                      ? context.colorScheme.background
                                      : context.colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: GestureDetector(
                          onTap: isLoading ? null : () {
                            setState(() => selectedGender = 'Female');
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedGender == 'Female'
                                  ? context.colorScheme.primary
                                  : context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Female',
                                style: TextStyle(
                                  color: selectedGender == 'Female'
                                      ? context.colorScheme.background
                                      : context.colorScheme.onSecondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(56),
                  Text("How Old are you ?", style: context.textTheme.titleMedium),
                  verticalSpace(12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: DropdownButton<String>(
                      value: selectedAge,
                      isExpanded: true,
                      underline: const SizedBox(),
                      hint: Text('Age Range', style: context.textTheme.bodyLarge),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: context.colorScheme.onBackground,
                        size: 28.sp,
                      ),
                      dropdownColor: context.colorScheme.surface,
                      items: ageRanges.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: context.textTheme.bodyLarge),
                        );
                      }).toList(),
                      onChanged: isLoading ? null : (String? value) {
                        setState(() {
                          selectedAge = value;
                        });
                      },
                    ),
                  ),
                  verticalSpace(220),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () {
                        if (selectedGender != null && selectedAge != null) {
                          // Use the cubit to update gender and age
                          context.read<SignupCubit>().updateGenderAndAge(
                            selectedGender!,
                            selectedAge!,
                          );
                        } else {
                          if (selectedGender == null) {
                            context.showAppSnackBar(
                              "Please select your Gender",
                              isError: true,
                              icon: FontAwesomeIcons.circleExclamation,
                            );
                          } else {
                            context.showAppSnackBar(
                              "Please select your Age Range",
                              isError: true,
                              icon: FontAwesomeIcons.circleExclamation,
                            );
                          }
                        }
                      },
                      child: isLoading
                          ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.colorScheme.onPrimary,
                          ),
                        ),
                      )
                          : Text("Finish"),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

}
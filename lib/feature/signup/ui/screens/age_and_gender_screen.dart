import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helper/constants.dart';

class AgeAndGenderScreen extends StatefulWidget {
  const AgeAndGenderScreen({super.key});

  @override
  State<AgeAndGenderScreen> createState() => _AgeAndGenderScreenState();
}

class _AgeAndGenderScreenState extends State<AgeAndGenderScreen> {
  String? selectedGender;
  String? selectedAge;
  bool isLoading = false;

  Future<void> _onFinish() async {
    if (selectedGender != null && selectedAge != null) {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => isLoading = false);
      context.pushNamed(Routing.welcomeScreen);
    } else {
      if (selectedGender == null) {
        context.showAppSnackBar(
          'Please select your Gender',
          isError: true,
          icon: FontAwesomeIcons.circleExclamation,
        );
      } else {
        context.showAppSnackBar(
          'Please select your Age Range',
          isError: true,
          icon: FontAwesomeIcons.circleExclamation,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 160.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tell us About yourself',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(56),
              Text(
                'Who do you shop for ?',
                style: context.textTheme.titleMedium,
              ),
              verticalSpace(12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedGender = 'Male'),
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
                      onTap: () => setState(() => selectedGender = 'Female'),
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
              Text('How Old are you ?', style: context.textTheme.titleMedium),
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
                  onChanged: (String? value) {
                    setState(() => selectedAge = value);
                  },
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _onFinish,
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
                      : const Text('Finish'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../splash/theme/theme_cubit.dart';

Widget categoriesHome(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            child: Text("See all", style: context.textTheme.titleMedium),
          ),
        ],
      ),
      SizedBox(
        height: 80.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.5.w),
                child: CircleAvatar(
                  radius: 30.r,
                  backgroundColor: context.colorScheme.secondary,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Selling",
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Handle see all action
              },
              child: Text("See all", style: context.textTheme.titleMedium),
            ),
          ],
        ),
        verticalSpace(8),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Replace with actual item count
            itemBuilder: (context, index) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.5),
                  child: cardItem(
                    context,
                    'https://imgix.bustle.com/uploads/image/2025/1/31/1f6244e7/gettyimages-2196467089.jpg?w=900&h=1350&fit=crop&crop=focalpoint&dpr=2&fp-x=0.5048&fp-y=0.1996',
                    " Men's Jacket",
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget cardItem(BuildContext context, String imageUrl, String title) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    child: Container(
      width: 160.0.w,
      padding: 8.0.all,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, fit: BoxFit.fill, height: 220.h),
          verticalSpace(8),
          Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

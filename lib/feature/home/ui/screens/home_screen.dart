import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../../core/widgets/block_back.dart';
import '../widgets/categories_home.dart';
import '../widgets/top_selling.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return BackBlocker(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                backgroundColor: context.colorScheme.background,
                elevation: 0,
                toolbarHeight: 100.h,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(top: 40.h, left: 24.w, right: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundColor: context.colorScheme.primary,
                        child: Icon(Icons.person,
                            color: context.colorScheme.onPrimary),
                      ),
                      Container(
                        height: 50.h,
                        width: 72.w,
                        decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            'Male',
                            style: context.textTheme.displayMedium?.copyWith(
                              color: context.colorScheme.onBackground,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25.r,
                        backgroundColor: context.colorScheme.primary,
                        child: Icon(Icons.shopping_bag_outlined,
                            color: context.colorScheme.onPrimary),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: LiquidPullToRefresh(
                  onRefresh: _onRefresh,
                  color: context.colorScheme.primary,
                  backgroundColor: context.colorScheme.onPrimary,
                  height: 120.h,
                  animSpeedFactor: 2.0,
                  showChildOpacityTransition: true,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: context.colorScheme.onBackground,
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: context.colorScheme.onBackground,
                              ),
                              filled: true,
                              fillColor: context.colorScheme.surface,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90.r),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          verticalSpace(24),
                          categoriesHome(context),
                          verticalSpace(24),
                          const TopSelling(),
                          verticalSpace(24),
                          const TopSelling(),
                          verticalSpace(24),
                          const TopSelling(),
                          verticalSpace(24),
                          const TopSelling(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
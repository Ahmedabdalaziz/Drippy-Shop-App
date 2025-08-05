import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:drippydrop_app/core/helper/extensions.dart';
import 'package:drippydrop_app/feature/home/ui/screens/home_screen.dart';
import 'package:drippydrop_app/feature/notification/ui/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../logic/navigation_cubit.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> screens = [
    const HomeScreen(),
    const NotificationScreen(),
    const Center(child: Text('Order Screen')),
    const Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, navState) {
          int actualCurrentIndex = 0;
          if (navState is NavigationTabSelected) {
            actualCurrentIndex = navState.currentIndex;
          }
          return Scaffold(
            extendBody: true,
            body: Stack(
              children: [
                PageStorage(
                  bucket: _bucket,
                  child: IndexedStack(
                    index: actualCurrentIndex,
                    children: screens,
                  ),
                ),
                Positioned(
                  left: 1.w,
                  right: 1.w,
                  bottom: 5.h,
                  child: CrystalNavigationBar(
                    height: 75.h,
                    currentIndex: actualCurrentIndex,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    selectedItemColor: context.colorScheme.primary,
                    unselectedItemColor: context.colorScheme.onPrimaryContainer,
                    onTap: (idx) =>
                        context.read<NavigationCubit>().selectTab(idx),
                    items: [
                      CrystalNavigationBarItem(icon: FontAwesomeIcons.house),
                      CrystalNavigationBarItem(icon: FontAwesomeIcons.bell),
                      CrystalNavigationBarItem(icon: FontAwesomeIcons.receipt),
                      CrystalNavigationBarItem(
                        icon: FontAwesomeIcons.solidUser,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:drippydrop_app/core/routing/app_routing.dart';
import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:drippydrop_app/feature/splash/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocBuilder;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theming/theme.dart';

class DrippyDropApp extends StatelessWidget {
  final AppRouter appRouter;

  const DrippyDropApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => ThemeCubit()..loadTheme(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            ThemeMode currentThemeMode;
            if (state is ThemeDark) {
              currentThemeMode = ThemeMode.dark;
            } else if (state is ThemeLight) {
              currentThemeMode = ThemeMode.light;
            } else {
              currentThemeMode = ThemeMode.system;
            }
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: currentThemeMode,
              debugShowCheckedModeBanner: false,
              initialRoute: Routing.splash,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}

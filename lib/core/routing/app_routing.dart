import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:drippydrop_app/feature/error_screen/error_screen.dart';
import 'package:drippydrop_app/feature/login/logic/login_cubit.dart';
import 'package:drippydrop_app/feature/login/ui/screens/login_screen.dart';
import 'package:drippydrop_app/feature/signup/ui/screens/age_and_gender_screen.dart';
import 'package:drippydrop_app/feature/signup/ui/screens/signup_screen.dart';
import 'package:drippydrop_app/feature/welcome/ui/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../feature/home/ui/widgets/navigation.dart';
import '../../feature/signup/logic/signup_cubit.dart';
import '../../feature/splash/ui/splash_screen.dart';

class AppRouter {
  final getIt = GetIt.instance;

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routing.splash:
        return createRoute(const SplashScreen());

      case Routing.login:
        return createRoute(
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routing.signup:
        return createRoute(
          BlocProvider<SignupCubit>.value(
            value: getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routing.welcomeScreen:
        return createRoute(const WelcomeScreen());

      case Routing.ageAndGender:
        return createRoute(
          BlocProvider<SignupCubit>.value(
            value: getIt<SignupCubit>(),
            child: const AgeAndGenderScreen(),
          ),
        );

      case Routing.navigator:
        return createRoute(const Navigation());

      default:
        return createRoute(const ErrorScreen());
    }
  }
}

Route<dynamic> createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}

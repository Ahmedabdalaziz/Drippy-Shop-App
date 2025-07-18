import 'package:drippydrop_app/core/routing/routs.dart';
import 'package:drippydrop_app/feature/home/ui/screens/home_screen.dart';
import 'package:drippydrop_app/feature/login/logic/login_cubit.dart';
import 'package:drippydrop_app/feature/login/ui/screens/login_screen.dart';
import 'package:drippydrop_app/feature/signup/ui/screens/signup_screen.dart';
import 'package:drippydrop_app/feature/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../feature/signup/logic/signup_cubit.dart';

class AppRouter {
  final getIt = GetIt.instance;

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routing.splash:
        return createRoute(SplashScreen());

      case Routing.login:
        return createRoute(
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routing.signup:
        return createRoute(
          BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignupScreen(),
          ),
        );

      case Routing.emailConfirm:
        return createRoute(Scaffold(
          body: Center(
            child: Text("hereeeeeeee done"),
          ),
        ));
        
      case Routing.home:
        return createRoute(HomeScreen());

      default:
        return createRoute(Container());
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

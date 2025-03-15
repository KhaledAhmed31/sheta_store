import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:sheta_store/features/main_layout/presentation/main_layout.dart';

import '../../features/splash/splash_screen.dart';

class RoutesGenerator {
  static GoRouter getRoute = GoRouter(
    routes: [
          GoRoute(path: "/", builder: (context, state) => SplashScreen()),
          GoRoute(
            path: RouteName.signInScreen,
            builder: (context, state) => SignInScreen(),
          ),
          GoRoute(
            path: RouteName.signUpScreen,
            builder: (context, state) => SignUpScreen(),
          ),
          GoRoute(
            path: RouteName.mainScreen,
            builder: (context, state) => MainScreen(),
          ),
        ],
  );
}

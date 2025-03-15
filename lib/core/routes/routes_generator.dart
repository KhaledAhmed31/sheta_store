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
            pageBuilder: (context, state) => CustomTransitionPage(child: SignInScreen(),
            key: state.pageKey,
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity:  CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            ),
           reverseTransitionDuration: Duration(milliseconds: 500),
          ),
          ),
          GoRoute(
            path: RouteName.signUpScreen,
            pageBuilder: (context, state) => CustomTransitionPage(child: SignUpScreen(),
            key: state.pageKey,
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity:  CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            ),
           reverseTransitionDuration: Duration(milliseconds: 500),
          ),
          ),
          GoRoute(
              path: RouteName.mainScreen,
            pageBuilder: (context, state) => CustomTransitionPage(child: MainScreen(),
            key: state.pageKey,
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity:  CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            ),
           reverseTransitionDuration: Duration(milliseconds: 500),
          ),


          ),
        ],
  );
}

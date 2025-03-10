import 'package:flutter/material.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sheta_store/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:sheta_store/features/main_layout/presentation/main_layout.dart';

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case "MainScreen":
        return MaterialPageRoute(builder: (_) => MainScreen());
      case 'SingnInScreen':
        return MaterialPageRoute(builder: (_) => SignIn());
      case 'SignUpScreen':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}

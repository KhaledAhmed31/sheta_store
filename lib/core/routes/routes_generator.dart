import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Container());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  } 
}
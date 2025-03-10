import 'package:flutter/material.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.main,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.main,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(color: AppColors.main, fill: 1),
    ),
  );
}

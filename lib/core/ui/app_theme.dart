import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.main,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white,systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.main,
      showSelectedLabels: false,
      showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,

    ),
  );
}

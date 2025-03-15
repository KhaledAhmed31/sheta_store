import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/features/main_layout/presentation/home/home_tap.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/bottom_nav_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> taps = [
    HomeTap(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int currentTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        title: Image.asset(
          Assets.logo3,
          height: AppHeight.h22,
          width: AppHeight.h66,
          color: AppColors.main,
          alignment: Alignment.centerLeft,
        ),
        titleSpacing: 25,
      ),
      body: taps[currentTapIndex],

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomAppBar(
          height: AppHeight.h75,
          padding: EdgeInsets.zero,
          child: BottomNavigationBar(
            currentIndex: currentTapIndex,
            onTap: (index) {
              setState(() {
                currentTapIndex = index;
              });
            },
            items: [
              CustomBottomNavBarItem(Assets.homeIcon),
              CustomBottomNavBarItem(Assets.categoryIcon),
              CustomBottomNavBarItem(Assets.favoriteIcon),
              CustomBottomNavBarItem(Assets.profileIcon),
            ],
          ),
        ),
      ),
    );
  }
}

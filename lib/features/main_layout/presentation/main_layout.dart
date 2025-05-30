import 'package:flutter/material.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/core/widgets/cart_button.dart';
import 'package:sheta_store/features/categories/presentation/category_tap/category_tap.dart';
import 'package:sheta_store/features/main_layout/presentation/home/home_tap.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/bottom_nav_bar_item.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> taps = [
    HomeTap(),
    CategoryTap(),
    Container(),
    Container(),
  ];
  int currentTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Assets.logo3,
          height: AppHeight.h22,
          width: AppHeight.h66,
          color: AppColors.main,
          alignment: Alignment.centerLeft,
        ),
        titleSpacing: 25,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          if (currentTapIndex != 3)
            Padding(
              padding: EdgeInsets.only(
                bottom: AppMargin.m17,
                left: AppMargin.m17,
                right: AppMargin.m17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CustomSearchBar(), CartButton()],
              ),
            ),

          taps[currentTapIndex],
        ],
      ),

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

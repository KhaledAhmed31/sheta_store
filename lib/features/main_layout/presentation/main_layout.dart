import 'package:flutter/material.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/features/categories/presentation/category_tap/category_tap.dart';
import 'package:sheta_store/features/wishlist/presentation/pages/wishlist_tap.dart';
import 'package:sheta_store/features/main_layout/presentation/home/home_tap.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/bottom_nav_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> taps = [
    HomeTap(),
    CategoryTap(),
    WishlistTap(),
    Container(),
  ];
  int currentTapIndex = 0;
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentTapIndex);
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentTapIndex = index;
          });
        },

        children: taps,
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
              pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
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




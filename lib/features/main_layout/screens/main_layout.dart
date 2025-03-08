import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/main_layout/domain/entities/banner_entitie.dart';
import 'package:sheta_store/features/main_layout/widgets/banner/app_banner.dart';
import 'package:sheta_store/features/main_layout/widgets/search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BannerEntitie> bannerItems = [
      BannerEntitie(
        image: "assets/images/banner1.png",
        discount: 20,
        category: "For Laptops \n& Mobiles",
      ),
      BannerEntitie(
        image: "assets/images/banner2.png",
        discount: 25,
        category: "For all Headphones \n& AirPods",
      ),
      BannerEntitie(
        image: "assets/images/banner3.png",
        discount: 30,
        category: "For all Makeup \n& Skincare",
        textOnLeft: false,
        isDark: true
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppMargin.m17,
            vertical: AppMargin.m6,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo3.png",
                height: AppHeight.h22,
                width: AppHeight.h66,
                color: AppColors.main,
                alignment: Alignment.centerLeft,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSearchBar(),
                  SvgPicture.asset("assets/icons/cart.svg"),
                ],
              ),
              AppBanner(bannerItems: bannerItems),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_outlined),
              label: "tllt",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarms_outlined),
              label: "tllt",
            ),
          ],
        ),
      ),
    );
  }
}

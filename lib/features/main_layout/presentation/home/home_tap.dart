import 'package:flutter/material.dart';
import 'package:sheta_store/core/assets/assets.dart';

import 'package:sheta_store/features/main_layout/domain/entities/banner_entitie.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/banner/app_banner.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/category/categories_section.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap>  {
  @override
  Widget build(BuildContext context) {
    List<BannerEntitie> bannerItems = [
      BannerEntitie(
        image: Assets.bannerImg1,
        discount: 20,
        category: "For Laptops \n& Mobiles",
      ),
      BannerEntitie(
        image: Assets.bannerImg2,
        discount: 25,
        category: "For all Headphones \n& AirPods",
      ),
      BannerEntitie(
        image: Assets.bannerImg3,
        discount: 30,
        category: "For all Makeup \n& Skincare",
        textOnLeft: false,
        isDark: true,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [AppBanner(bannerItems: bannerItems), CategoriesSection()],
    );
  }

  
}

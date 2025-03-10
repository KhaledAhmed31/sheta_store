import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/main_layout/domain/entities/banner_entitie.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/banner/app_banner.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/categories_section.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/search_bar.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

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

    return  Padding(
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
              CategoriesSection( )
            ],
          ),
        )
;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/main_layout/domain/entities/banner_entitie.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/banner/app_banner.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/category/categories_section.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/search_bar.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

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
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppMargin.m17,
            vertical: AppMargin.m17,
          ),
          child: Image.asset(
            Assets.logo3,
            height: AppHeight.h22,
            width: AppHeight.h66,
            color: AppColors.main,
            alignment: Alignment.centerLeft,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            bottom: AppMargin.m17,
            left: AppMargin.m17,
            right: AppMargin.m17,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [CustomSearchBar(), SvgPicture.asset(Assets.cartIcon)],
          ),
        ),

        AppBanner(bannerItems: bannerItems),
        CategoriesSection(),
      ],
    );
  }
}

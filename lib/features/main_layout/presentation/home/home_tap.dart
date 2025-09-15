import 'package:flutter/material.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/ui/app_padding_margin.dart';
import '../../../../core/widgets/cart_button.dart';

import '../../domain/entities/banner_entitie.dart';
import 'widgets/banner/app_banner.dart';
import 'widgets/category/categories_section.dart';
import 'widgets/search_bar.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
        AppBanner(bannerItems: bannerItems),
        CategoriesSection(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

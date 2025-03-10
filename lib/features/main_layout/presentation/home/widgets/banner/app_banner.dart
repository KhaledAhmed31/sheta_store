import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/main_layout/domain/entities/banner_entitie.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/banner/banner_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key, required this.bannerItems});
  final List<BannerEntitie> bannerItems;
  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: currentIndex);

    return Container(
      width: double.infinity,
      height: AppHeight.h200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            itemCount: widget.bannerItems.length,
            itemBuilder:
                (context, index) =>
                    BannerItem(bannerEntitie: widget.bannerItems[index]),
            controller: pageController,
            onPageChanged: (value) => setState(() => currentIndex = value),
          ),
          Positioned(
            bottom: AppMargin.m8,
            child: SmoothPageIndicator(
              controller: pageController,
              onDotClicked: (index) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut,
                );
              },
              count: widget.bannerItems.length,
              effect: JumpingDotEffect(
                dotHeight: AppHeight.h12,
                dotWidth: AppWidth.w12,
                activeDotColor: AppColors.main,
                dotColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

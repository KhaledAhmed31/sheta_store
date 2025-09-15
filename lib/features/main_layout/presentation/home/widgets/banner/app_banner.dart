import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/ui/app_colors.dart';
import '../../../../../../core/ui/app_height.dart';
import '../../../../../../core/ui/app_padding_margin.dart';
import '../../../../domain/entities/banner_entitie.dart';
import 'banner_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key, required this.bannerItems});
  final List<BannerEntitie> bannerItems;
  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  int _currentPage = 0;
  // ignore: unused_field
  Timer? _timer;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      switchBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidth.w400,
      height: AppHeight.h200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            padEnds: false,
            itemCount: widget.bannerItems.length,
            itemBuilder:
                (context, index) =>
                    BannerItem(bannerEntitie: widget.bannerItems[index]),
            controller: pageController,
            physics: AlwaysScrollableScrollPhysics(),
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
              effect: SwapEffect(
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

  void switchBanner() {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 650),
      curve: Curves.ease,
    );
  }
}

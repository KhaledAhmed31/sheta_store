import 'package:flutter/material.dart';
import '../../../../../../core/fonts/font_size_manager.dart';
import '../../../../../../core/fonts/font_style_manager.dart';
import '../../../../../../core/ui/app_colors.dart';
import '../../../../../../core/ui/app_padding_margin.dart';
import '../../../../domain/entities/banner_entitie.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.bannerEntitie});

  final BannerEntitie bannerEntitie;

  @override
  Widget build(BuildContext context) {
    Color color = (!bannerEntitie.isDark) ? AppColors.main : Colors.white;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(bannerEntitie.image, fit: BoxFit.fill),
        Positioned(
          top: AppMargin.m20,
          left: (bannerEntitie.textOnLeft) ? AppMargin.m36 : null,
          right: (bannerEntitie.textOnLeft) ? null : AppMargin.m36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "UP TO\n",
                      style: FontStyleManager.mediumStyle(
                        height: 1,
                        size: FontSizeManager.s18,
                        color: color,
                      ),
                    ),
                    TextSpan(
                      text: "${bannerEntitie.discount}%",
                      style: FontStyleManager.mediumStyle(
                        height: .9,
                        size: FontSizeManager.s30,
                        color: color,
                      ),
                    ),
                    TextSpan(
                      text: " OFF",
                      style: FontStyleManager.mediumStyle(
                        size: FontSizeManager.s20,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                bannerEntitie.category,
                style: FontStyleManager.regularStyle(
                  size: FontSizeManager.s14,
                  color: color,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Shop Now",
                  style: FontStyleManager.regularStyle(
                    size: FontSizeManager.s14,
                    color:
                        !bannerEntitie.isDark ? Colors.white : AppColors.main,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

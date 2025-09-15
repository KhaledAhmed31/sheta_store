import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/ui/app_colors.dart';
import '../../../../../core/ui/app_height.dart';
import '../../../../../core/ui/app_radius.dart';

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;
  CustomBottomNavBarItem(this.iconPath, [this.title = ''])
    : super(
        label: title,
        icon: CircleAvatar(
          radius: AppRadius.r17,
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            height: AppHeight.h25,
            iconPath, // Inactive icon image
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ), // Inactive icon color
          ),
        ),
        activeIcon: CircleAvatar(
          radius: AppRadius.r17,
          backgroundColor: Colors.white, // Background of active icon
          child: SvgPicture.asset(
            height: AppHeight.h22,
            iconPath,
            colorFilter: ColorFilter.mode(
              AppColors.main,
              BlendMode.srcIn,
            ), // Active icon imagecolor: ColorManager.primary, // Active icon color
          ),
        ),
      );
}

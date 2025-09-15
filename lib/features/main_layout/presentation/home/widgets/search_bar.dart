import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/assets/assets.dart';
import '../../../../../core/fonts/font_size_manager.dart';
import '../../../../../core/fonts/font_style_manager.dart';
import '../../../../../core/ui/app_colors.dart';
import '../../../../../core/ui/app_height.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h50,
      width: AppWidth.w350,
      child: TextField(
        autofocus: false,
        cursorColor: AppColors.main,
        style: FontStyleManager.regularStyle(
          size: FontSizeManager.s15,
          color: AppColors.textColor,
        ),
        decoration: InputDecoration(
          hintText: "What do you want to search for?",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SvgPicture.asset(Assets.searchIcon, fit: BoxFit.none),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.main,
              style: BorderStyle.solid,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.main,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.main,
              style: BorderStyle.solid,
            ),
          ),
          hintStyle: FontStyleManager.lightStyle(
            size: FontSizeManager.s14,
            color: AppColors.trasparentMain,
          ),
        ),
      ),
    );
  }
}

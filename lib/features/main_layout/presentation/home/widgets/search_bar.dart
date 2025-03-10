import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppMargin.m17),
      child: SizedBox(
        height: AppHeight.h50,
        width: AppWidth.w350,
        child: TextField(
          decoration: InputDecoration(
            hintText: "What do you want to search for?",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SvgPicture.asset(
                "assets/icons/search.svg",
                fit: BoxFit.none,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(width: 1, color: AppColors.main),
            ),
            hintStyle: FontStyleManager.lightStyle(
              size: FontSizeManager.s14,
              color: AppColors.trasparentMain,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class FontStyleManager {
  // ignore: unused_element
  static TextStyle _getStyel({
    required double size,
    required FontWeight weight,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      height: height,
      fontSize: size,
      fontWeight: weight,
      color: color,
      fontFamily: "Poppins",
    );
  }

  static TextStyle lightStyle({
    required double size,
    required Color color,
    double? height,
  }) => _getStyel(
    size: size,
    weight: FontWeight.w300,
    color: color,
    height: height,
  );
  static TextStyle regularStyle({
    required double size,
    required Color color,
    double? height,
  }) => _getStyel(
    size: size,
    weight: FontWeight.w400,
    color: color,
    height: height,
  );
  static TextStyle mediumStyle({
    required double size,
    required Color color,
    double? height,
  }) => _getStyel(
    size: size,
    weight: FontWeight.w500,
    color: color,
    height: height,
  );
  static TextStyle semiBoldStyle({
    required double size,
    required Color color,
    double? height,
  }) => _getStyel(
    size: size,
    weight: FontWeight.w600,
    color: color,
    height: height,
  );
  static TextStyle boldStyle({
    required double size,
    required Color color,
    double? height,
  }) => _getStyel(
    size: size,
    weight: FontWeight.w700,
    color: color,
    height: height,
  );

  static TextStyle withLineThroygh({double? size}) {
    return TextStyle(
      color: AppColors.main,
      fontFamily: "Poppins",
      decoration: TextDecoration.lineThrough,
      fontSize:(size==null)? FontSizeManager.s12 : size,
      fontWeight: FontWeight.w400,
      decorationColor: AppColors.main,
      decorationThickness: 2,
      height: 1,
    );
  }
}

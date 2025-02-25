import 'package:flutter/material.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class FontStyleManager {
  // ignore: unused_element
  static TextStyle _getStyel({required double size,required FontWeight weight,required Color color}) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      fontFamily: "Poppins",   

    );
  }

  static TextStyle lightStyle({required double size,required Color color}) => _getStyel(size: size, weight: FontWeight.w300, color: color);
  static TextStyle regularStyle({required double size,required Color color}) => _getStyel(size: size, weight: FontWeight.w400, color: color);
  static TextStyle mediumStyle({required double size,required Color color}) => _getStyel(size: size, weight: FontWeight.w500, color: color);
  static TextStyle semiBoldStyle({required double size,required Color color}) => _getStyel(size: size, weight: FontWeight.w600, color: color);
  static TextStyle boldStyle({required double size,required Color color}) => _getStyel(size: size, weight: FontWeight.w700, color: color);


  static TextStyle withLineThroygh(){
    return TextStyle(color: AppColors.main,fontFamily: "Poppins",decoration: TextDecoration.lineThrough,fontSize: 12,fontWeight: FontWeight.w400,decorationColor: AppColors.main,decorationThickness: 2);
  }
}

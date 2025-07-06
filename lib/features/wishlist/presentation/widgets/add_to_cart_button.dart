import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class AddWishItemToCartButton extends StatefulWidget {
  const AddWishItemToCartButton({super.key});

  @override
  State<AddWishItemToCartButton> createState() =>
      _AddWishItemToCartButtonState();
}

class _AddWishItemToCartButtonState extends State<AddWishItemToCartButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.main,
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      onPressed: () {},
      child: Text(
        "Add to cart",
        style: FontStyleManager.mediumStyle(color: Colors.white, size: 14.sp),
      ),
    );
  }
}

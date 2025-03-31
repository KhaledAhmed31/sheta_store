import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 270.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.add_shopping_cart_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
            Text(
              'Add to cart',
              style: FontStyleManager.mediumStyle(
                size: FontSizeManager.s20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

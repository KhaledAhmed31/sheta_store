
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class ProductQuantityButton extends StatefulWidget {
  const ProductQuantityButton({
    super.key,
    required this.avilableQuantity,
    required this.onQuantityChanged,
  });
  final int avilableQuantity;
  final void Function(int quantity) onQuantityChanged;
  @override
  State<ProductQuantityButton> createState() => _ProductQuantityButtonState();
}

class _ProductQuantityButtonState extends State<ProductQuantityButton> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 122.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (quantity > 1) {
                  quantity--;
                  widget.onQuantityChanged.call(quantity);
                }
              },
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  quantity.toString(),
                  style: FontStyleManager.mediumStyle(
                    size: FontSizeManager.s18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (quantity < widget.avilableQuantity) {
                  ++quantity;
                  widget.onQuantityChanged.call(quantity);
                }
              },
              icon: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

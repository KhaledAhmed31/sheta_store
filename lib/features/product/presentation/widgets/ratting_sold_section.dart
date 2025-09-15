import 'package:flutter/widgets.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import '../../domain/entities/product_entity.dart';
import 'product_quantity_button.dart';

class RattingSoldSection extends StatefulWidget {
  const RattingSoldSection({
    super.key,
    required ProductEntity product,
    required this.onTapQuantatyButton,
  }) : _productEntity = product;
  final ProductEntity _productEntity;
  final void Function(int quantity) onTapQuantatyButton;
  @override
  State<RattingSoldSection> createState() => _RattingSoldSectionState();
}

class _RattingSoldSectionState extends State<RattingSoldSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 16.w,
          children: [
            SizedBox(
              width: 102.w,
              height: 34.h,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.stroke, width: 1.w),
                ),
                child: Center(
                  child: Text(
                    "${widget._productEntity.sold ?? 0} sold",
                    style: FontStyleManager.mediumStyle(
                      size: FontSizeManager.s14,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                RatingStars(
                  value: widget._productEntity.ratingAverage ?? 0,
                  valueLabelVisibility: false,
                  starSize: 15.sp,
                ),
                Text(
                  "${widget._productEntity.ratingAverage ?? 0} (${widget._productEntity.ratingsQuantity ?? 0})",
                  style: FontStyleManager.regularStyle(
                    size: FontSizeManager.s14,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        ProductQuantityButton(
          avilableQuantity: widget._productEntity.quantity ?? 1,
          onQuantityChanged: widget.onTapQuantatyButton,
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class TitlePriceSection extends StatelessWidget {
  const TitlePriceSection({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250.w,
          child: Text(
            product.title ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: FontStyleManager.mediumStyle(
              size: FontSizeManager.s18,
              color: AppColors.textColor,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "EGP ${((product.priceAfterDiscount ?? 0).ceil() == product.priceAfterDiscount) ? (product.priceAfterDiscount ?? 0).toStringAsFixed(0) : (product.priceAfterDiscount ?? 0).toStringAsFixed(2)}",
              style: FontStyleManager.mediumStyle(
                size: FontSizeManager.s18,
                color: AppColors.textColor,
              ),
            ),
            Text(
              (product.price ?? 0).ceil().toString(),
              style: FontStyleManager.withLineThroygh(
                size: FontSizeManager.s15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import 'check_out_button.dart';

class PriceCheckOutSection extends StatefulWidget {
  const PriceCheckOutSection({
    super.key,
    required this.totalPrice,
    required this.onTap,
  });
  final String totalPrice;
  final void Function() onTap;
  @override
  State<PriceCheckOutSection> createState() => _PriceCheckOutSectionState();
}

class _PriceCheckOutSectionState extends State<PriceCheckOutSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Total Price',
                style: FontStyleManager.mediumStyle(
                  size: FontSizeManager.s18,
                  color: AppColors.trasparentMain,
                ),
              ),
              Text(
                "EGP ${widget.totalPrice}",
                style: FontStyleManager.mediumStyle(
                  size: FontSizeManager.s18,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          ChackOutButton(onTap: widget.onTap),
        ],
      ),
    );
  }
}

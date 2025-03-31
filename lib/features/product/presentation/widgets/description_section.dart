import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: FontStyleManager.mediumStyle(
            size: FontSizeManager.s18,
            color: AppColors.textColor,
          ),
        ),
        ReadMoreText(
          trimLines: 2,
          trimMode: TrimMode.Line,
          lessStyle: FontStyleManager.mediumStyle(
            size: FontSizeManager.s14,
            color: AppColors.textColor,
          ),
          moreStyle: FontStyleManager.mediumStyle(
            size: FontSizeManager.s14,
            color: AppColors.textColor,
          ),
          description,
          style: FontStyleManager.regularStyle(
            size: FontSizeManager.s14,
            color: AppColors.trasparentMain,
          ),
        ),
      ],
    );
  }
}

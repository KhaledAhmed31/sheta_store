import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';

class SelectCategoryBarItem extends StatelessWidget {
  const SelectCategoryBarItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.index,
    required this.onTap,
  });
  final int index;
  final String title;
  final bool isSelected;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,

      overlayColor: WidgetStateProperty.all(AppColors.overlay),
      onTap: () {
        onTap(index);
      },
      child: Container(
        height: 80.w,
        decoration: BoxDecoration(color: (isSelected) ? null : AppColors.tint),
        padding: EdgeInsets.only(left: 5.w),
        child: Row(
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isSelected)
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  height: 70.h,
                  width: 7.w,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  title,                  
                  style: FontStyleManager.mediumStyle(
                    color: AppColors.textColor,
                    size: FontSizeManager.s14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

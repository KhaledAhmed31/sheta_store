import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class ChackOutButton extends StatelessWidget {
  const ChackOutButton({super.key, required this.onTap});
  final void Function() onTap;
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
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Check Out',
              style: FontStyleManager.mediumStyle(
                size: FontSizeManager.s20,
                color: Colors.white,
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white, size: 25.sp),
          ],
        ),
      ),
    );
  }
}

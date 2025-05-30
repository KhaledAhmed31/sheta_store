import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sheta_store/core/ui/app_colors.dart' show AppColors;
import 'package:sheta_store/features/categories/domain/entities/category_entity.dart';
import 'package:sheta_store/features/categories/presentation/widgets/select_category_bar_item.dart';

class SelectCategoryBar extends StatefulWidget {
  const SelectCategoryBar({
    super.key,
    required this.categories,
    required this.onTap,
  });

  final List<CategoryEntity> categories;
  final void Function(int) onTap;
  @override
  State<SelectCategoryBar> createState() => _SelectCategoryBarState();
}

class _SelectCategoryBarState extends State<SelectCategoryBar> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        bottomLeft: Radius.circular(10.r),
        bottomRight: Radius.circular(10.r),
      ),
      child: Container(
        width: 135.w,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 270.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          border: Border(
            left: BorderSide(width: 1.w, color: AppColors.stroke),
            bottom: BorderSide(width: 1.w, color: AppColors.stroke),
            top: BorderSide(width: 1.w, color: AppColors.stroke),
          ),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder:
              (context, index) => SelectCategoryBarItem(
                title: widget.categories[index].name ?? "",
                isSelected: index == isSelected,
                index: index,
                onTap: (cardIndex) {
                  widget.onTap(cardIndex);
                  setState(() {
                    isSelected = cardIndex;
                  });
                },
              ),
          itemCount: widget.categories.length,
        ),
      ),
    );
  }
}

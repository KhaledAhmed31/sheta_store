import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/features/categories/domain/entities/category_model.dart';

class CategorySectionItem extends StatelessWidget {
  const CategorySectionItem({super.key, required this.categoryData});
  final CategoryEntite categoryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppHeight.h100,
          width: AppHeight.h100,
          child: ClipRRect( 
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: categoryData.imageUrl ?? '',
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(height: AppHeight.h12),
        Text(
          categoryData.name ?? '',
          textAlign: TextAlign.center,
          style: FontStyleManager.mediumStyle(
            size: FontSizeManager.s12,
            color: AppColors.main,
          ),
        ),
      ],
    );
  }
}

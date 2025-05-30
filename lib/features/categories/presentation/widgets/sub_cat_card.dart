import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class SubCatCard extends StatelessWidget {
  const SubCatCard({super.key, required this.image, required this.title, required this.subCatId});
  final String image;
  final String title;
  final String subCatId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RouteName.productScreen,extra: subCatId),
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.fill,
                errorWidget:
                    (context, url, error) => Icon(
                      Icons.image_not_supported_outlined,
                      color: AppColors.main,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: FontStyleManager.mediumStyle(
                size: FontSizeManager.s12,
                color: AppColors.main,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

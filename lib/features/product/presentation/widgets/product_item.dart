import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_radius.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFav = false;
  bool addedToCart = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 240.h,
          width: 190.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r15),
            border: Border.all(
              color: Color.fromARGB(153, 0, 65, 130),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 130.h,
                width: 190.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppRadius.r13),
                  ),

                  child: PageView.builder(
                    itemBuilder:
                        (context, index) => CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.product.images?[index] ?? '',
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                    itemCount: widget.product.images!.length,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.product.title ?? '',maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FontStyleManager.mediumStyle(
                        size: 13,
                      
                        height: 1,
                        color: AppColors.main,
                      ),
                      textHeightBehavior: TextHeightBehavior(),
                    ),
                    Text(
                      widget.product.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FontStyleManager.mediumStyle(
                        size: 13,

                        color: AppColors.main,
                      ),
                    ),
                    Row(
                      spacing: 15.w,
                      children: [
                        Text(
                          "EGP ${widget.product.priceAfterDiscount??0}",
                          style: FontStyleManager.mediumStyle(
                            size: 15,
                            color: AppColors.main,
                          ),
                        ),
                        Text(
                          "${widget.product.price??0}",
                          style: FontStyleManager.withLineThroygh(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingStars(
                          value: widget.product.ratingAverage ?? 0,
                          starSize: 14.w,
                          valueLabelVisibility: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0.h,
          bottom: 0.h,
          child: IconButton(
            highlightColor: Colors.transparent,

            isSelected: addedToCart,
            selectedIcon: CircleAvatar(
              radius: 18.r,
              backgroundColor: AppColors.main,
              child: Icon(
                Icons.done_outline_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            onPressed: () {
              setState(() {
                addedToCart = !addedToCart;
              });
            },
            icon: CircleAvatar(
              radius: 18.r,
              backgroundColor: AppColors.main,
              child: SvgPicture.asset(
                Assets.addIcon,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0.h,
          child: IconButton(
            highlightColor: Colors.transparent,

            isSelected: isFav,
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            selectedIcon: CircleAvatar(
              radius: 18.r,
              backgroundColor: AppColors.main,
              child: SvgPicture.asset(
                Assets.favoriteIcon,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            icon: CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                Assets.favoriteIcon,
                colorFilter: ColorFilter.mode(AppColors.main, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

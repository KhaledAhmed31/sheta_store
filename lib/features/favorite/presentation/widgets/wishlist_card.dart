import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_radius.dart';
import 'package:sheta_store/features/favorite/data/mapper/wishlist_to_product_entity_mapper.dart';
import 'package:sheta_store/features/favorite/domain/entities/wishlist_entity.dart';
import 'package:sheta_store/features/favorite/presentation/widgets/add_to_cart_button.dart';
import 'package:sheta_store/features/product/presentation/widgets/fav_botton.dart';

class WishlistCard extends StatefulWidget {
  const WishlistCard({super.key, required this.wishlistEnitityItem});
  final WishlistEnitityItem wishlistEnitityItem;

  @override
  State<WishlistCard> createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.push(
              RouteName.productDetailScreen,
              extra: widget.wishlistEnitityItem.toProductEntity(),
            );
          },
          child: Container(
            height: 120.h,
            width: 398.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke, width: 1.w),
              borderRadius: BorderRadius.circular(AppRadius.r15),
            ),
            padding: EdgeInsets.only(right: 8.w),
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.stroke, width: 1.w),
                    borderRadius: BorderRadius.circular(AppRadius.r15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.r15),
                    child: CachedNetworkImage(
                      imageUrl: widget.wishlistEnitityItem.imageCover ?? '',
                      height: 120.h,
                      width: 120.w,
                      fit: BoxFit.fill,
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        widget.wishlistEnitityItem.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontStyleManager.mediumStyle(
                          size: FontSizeManager.s18,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    Text(
                      'EGP ${widget.wishlistEnitityItem.priceAfterDiscount ?? 0}',
                      style: FontStyleManager.mediumStyle(
                        size: FontSizeManager.s18,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 18.w,
          child: FavButton(
            isSelected: true,
            productId: widget.wishlistEnitityItem.id ?? '',
          ),
        ),
        Positioned(bottom: 12.w, right: 25.w, child: AddWishItemToCartButton()),
      ],
    );
  }
}

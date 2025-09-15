import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_radius.dart';
import 'delete_item_button.dart';
import '../../domain/entities/cart_item_model.dart';
import 'quantity_button.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../../../product/presentation/cubit/product_cubit.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    getProductDetails();
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.push(RouteName.productDetailScreen, extra: productEntity);
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
                      imageUrl: widget.cartItemModel.product?.imageCover ?? '',
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
                        widget.cartItemModel.product?.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FontStyleManager.mediumStyle(
                          size: FontSizeManager.s18,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    Text(
                      'EGP ${widget.cartItemModel.price}',
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
          top: 0,
          right: 12.w,
          child: DeleteItemButton(id: widget.cartItemModel.product?.id ?? ''),
        ),
        Positioned(
          bottom: 12.w,
          right: 12.w,
          child: QuantityButton(
            avilableQuantity: widget.cartItemModel.product?.quantity ?? 0,
            quantity: widget.cartItemModel.count ?? 0,
            productId: widget.cartItemModel.product?.id ?? '',
          ),
        ),
      ],
    );
  }void getProductDetails()async{
 
      productEntity =await BlocProvider.of<ProductCubit>(
      context,
    ).getProductDetails(widget.cartItemModel.product!.id!);
    
}
}


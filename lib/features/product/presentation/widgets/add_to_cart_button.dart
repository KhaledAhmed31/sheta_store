
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_item_model.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_state.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_cubit.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = getIt.get<CartCubit>();
    ProductCubit productCubit = BlocProvider.of<ProductCubit>(context);
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
        onPressed: () async {
          (bool, int) isAdded = isInCart(
            cartCubit.cart!.cartDetails!.productItems ?? [],
            productEntity.id!,
          );
          if (productEntity.quantity! < (isAdded.$2 + productCubit.quantity)) {
            Fluttertoast.showToast(
              msg: "Quantity exceeds stock",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: AppColors.main,
              fontSize: 16.0,
            );
            return;
          }
          if (isAdded.$1) {
            await cartCubit.updateCartQuantity(
              productEntity.id ?? '',
              (productCubit.quantity) + isAdded.$2,
            );
          } else {
            await cartCubit.addToCart(productEntity.id ?? '');
            await cartCubit.updateCartQuantity(
              productEntity.id ?? '',
              (productCubit.quantity),
            );
          }
        },
        child: BlocBuilder<CartCubit, CartState>(
          bloc: cartCubit,
          builder: (context, state) {
            if (state is UpdateCartProductQuantityLoadingState ||
                state is AddToCartLoadingState) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                  Text(
                    'Add to cart',
                    style: FontStyleManager.mediumStyle(
                      size: FontSizeManager.s20,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

(bool, int) isInCart(List<CartItemModel> products, String id) {
  for (var i = 0; i < products.length; i++) {
    if (products[i].product?.id == id) {
      return (true, products[i].count ?? 0);
    }
  }
  return (false, 0);
}

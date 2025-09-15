import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/assets/assets.dart';
import '../../../../core/dependency_injection/identifiers.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../widgets/cart_card.dart';
import '../widgets/price_check_out_section.dart';
import '../../../product/presentation/cubit/product_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartCubit cubit;
  @override
  void initState() {
    cubit = getIt.get<CartCubit>()..getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_ios, color: AppColors.main),
          ),
          title: Text(
            'Cart',
            style: FontStyleManager.mediumStyle(
              size: FontSizeManager.s20,
              color: AppColors.main,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.searchIcon),
            ),
          ],
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is DeleteFromCartLoadingState ||
                state is UpdateCartProductQuantityLoadingState) {
              context.loaderOverlay.show();
            }
            if (state is DeleteFromCartSuccessState ||
                state is UpdateCartProductQuantitySuccessState) {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            if (state is GetCartLoadingState) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.main),
              );
            } else if (state is GetCartErrorState) {
              return Center(child: Text(state.message));
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: BlocProvider<ProductCubit>(
                        create: (context) => getIt.get<ProductCubit>(),
                        child: ListView.builder(
                          itemCount:
                              (cubit.cart!.cartDetails!.productItems ?? [])
                                  .length,
                          itemBuilder:
                              (context, index) => CartCard(
                                cartItemModel:
                                    cubit.cart!.cartDetails!.productItems![index],
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    PriceCheckOutSection(
                      totalPrice:
                          (cubit.cart!.cartDetails?.totalCartPrice ?? 0)
                              .toString(),
                      onTap: () {},
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

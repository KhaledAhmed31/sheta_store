import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_state.dart';

class CartBotton extends StatefulWidget {
  const CartBotton({super.key, required this.productId});
  final String productId;
  @override
  State<CartBotton> createState() => _CartBottonState();
}

class _CartBottonState extends State<CartBotton> {
  late CartCubit cartCubit;
  late bool isClicked;

  @override
  void initState() {
    super.initState();
    cartCubit = getIt.get<CartCubit>();
    log(widget.productId);
    isClicked = cartCubit.cart!.cartDetails!.productItems!.any(
      (element) => element.product!.id == widget.productId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      bloc: cartCubit,
      listener: (context, state) {
        if (state is AddToCartErrorState) {
          if (state.productId == widget.productId) {
            setState(() {
              isClicked = !isClicked;
            });
          }
        }else if (state is DeleteFromCartErrorState) {
          if (state.productId == widget.productId) {
            setState(() {
              isClicked = !isClicked;
            });
          }
        }
      },

      child: IconButton(
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          enableFeedback: true,
          elevation: 10,
          shadowColor: const Color.fromARGB(57, 158, 158, 158),
        ),
        enableFeedback: true,
        highlightColor: Colors.transparent,
      
        isSelected: isClicked,
        selectedIcon: CircleAvatar(
          radius: 18.r,
          backgroundColor: AppColors.main,
          child: Icon(Icons.done_outline_rounded, color: Colors.white, size: 20),
        ),
        onPressed: () {
          setState(() {
            !isClicked
                ? cartCubit.addToCart(widget.productId)
                : cartCubit.removeFromCart(widget.productId);
            isClicked = !isClicked;
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
    );
  }
}

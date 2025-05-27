import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/routes/route_name.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_state.dart';

class CartButton extends StatefulWidget {
  const CartButton({super.key});

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    int count = BlocProvider.of<CartCubit>(context).cart?.numOfCartItems ?? 0;
    return SizedBox(
      width: 25.w,
      child: IconButton(
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          context.push(RouteName.cartScreen);
        },
        icon: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is GetCartSuccessState ||
                state is AddToCartSuccessState ||
                state is DeleteFromCartSuccessState) {
              setState(() {});
            }
            setState(() {});
          },

          child: Badge.count(
            count: count,
            isLabelVisible: count != 0,
            child: SvgPicture.asset(Assets.cartIcon),
          ),
        ),
      ),
    );
  }
}

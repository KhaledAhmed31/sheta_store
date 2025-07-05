import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';

class CartBotton extends StatefulWidget {
  const CartBotton({super.key, required this.product});
  final String product;
  @override
  State<CartBotton> createState() => _CartBottonState();
}

class _CartBottonState extends State<CartBotton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
              ? BlocProvider.of<CartCubit>(context).addToCart(widget.product)
              : BlocProvider.of<CartCubit>(
                context,
              ).removeFromCart(widget.product);
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
    );
  }
}

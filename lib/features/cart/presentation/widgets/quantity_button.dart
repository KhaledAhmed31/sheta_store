import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import '../cubit/cart_cubit.dart';

// ignore: must_be_immutable
class QuantityButton extends StatefulWidget {
  QuantityButton({
    super.key,
    required this.avilableQuantity,
    required this.quantity, required this.productId,
  });
  int quantity;
  final int avilableQuantity;
  
  final String productId;
  @override
  State<QuantityButton> createState() => _ProductQuantityButtonState();
}

class _ProductQuantityButtonState extends State<QuantityButton> {
  late CartCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<CartCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 122.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (widget.quantity > 1) {
                  setState(() {
                    widget.quantity--;
                    cubit.updateCartQuantity(widget.productId,widget.quantity);
                  });
                }
              },
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.quantity.toString(),
                  style: FontStyleManager.mediumStyle(
                    size: FontSizeManager.s18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (widget.quantity < widget.avilableQuantity) {
                  setState(() {
                    ++widget.quantity;
                    cubit.updateCartQuantity(widget.productId,widget.quantity);
                  });
                }
              },
              icon: Icon(Icons.add_circle_outline_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

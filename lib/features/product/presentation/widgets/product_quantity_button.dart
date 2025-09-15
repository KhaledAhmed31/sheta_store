import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class ProductQuantityButton extends StatefulWidget {
  const ProductQuantityButton({
    super.key,
    required this.avilableQuantity,
    required this.onQuantityChanged,
  });
  final int avilableQuantity;
  final void Function(int quantity) onQuantityChanged;
  @override
  State<ProductQuantityButton> createState() => _ProductQuantityButtonState();
}

class _ProductQuantityButtonState extends State<ProductQuantityButton> {
  int quantity = 1;
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
        child: BlocBuilder<ProductCubit, ProductState>(
          builder:
              (context, state) => Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        quantity--;
                        BlocProvider.of<ProductCubit>(
                          context,
                        ).changeQuantity(quantity);
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
                        quantity.toString(),
                        style: FontStyleManager.mediumStyle(
                          size: FontSizeManager.s18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (quantity < widget.avilableQuantity) {
                        setState(() {
                          ++quantity;
                          BlocProvider.of<ProductCubit>(
                            context,
                          ).changeQuantity(quantity);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}

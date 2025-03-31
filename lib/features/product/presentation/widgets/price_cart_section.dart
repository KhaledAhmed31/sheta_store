import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/core/constants/auth_data_identifiers/auth_data_identifiers.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_cubit.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_state.dart';
import 'package:sheta_store/features/product/presentation/widgets/add_to_cart_button.dart';

class PriceCartSection extends StatefulWidget {
  const PriceCartSection({
    super.key,
    required this.product,
    required this.quantity,
  });
  final ProductEntity product;
  final int quantity;

  @override
  State<PriceCartSection> createState() => _PriceCartSectionState();
}

class _PriceCartSectionState extends State<PriceCartSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total Price',
              style: FontStyleManager.mediumStyle(
                size: FontSizeManager.s18,
                color: AppColors.trasparentMain,
              ),
            ),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (BuildContext context, state) {
                return Text(
                  'EGP ${(widget.product.priceAfterDiscount ?? 0) * BlocProvider.of<ProductCubit>(context).quantity}',
                  style: FontStyleManager.mediumStyle(
                    size: FontSizeManager.s18,
                    color: AppColors.textColor,
                  ),
                );
              },
            ),
          ],
        ),
        AddToCartButton(productEntity: widget.product),
      ],
    );
  }
}

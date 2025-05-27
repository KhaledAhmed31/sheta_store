import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart';

class DeleteItemButton extends StatefulWidget {
  const DeleteItemButton({super.key, required this.id});
  final String id;
  @override
  State<DeleteItemButton> createState() => _DeleteItemButtonState();
}

class _DeleteItemButtonState extends State<DeleteItemButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      child: IconButton(
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          BlocProvider.of<CartCubit>(context).removeFromCart(widget.id);
        },
        icon: SvgPicture.asset(Assets.deleteIcon),
      ),
    );
  }
}

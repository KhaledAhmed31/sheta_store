
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class CartBotton extends StatefulWidget {
  const CartBotton({super.key, required this.onTap});
  final void Function() onTap;
  @override
  State<CartBotton> createState() => _CartBottonState();
}

class _CartBottonState extends State<CartBotton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,

      isSelected: isClicked,
      selectedIcon: CircleAvatar(
        radius: 18.r,
        backgroundColor: AppColors.main,
        child: Icon(Icons.done_outline_rounded, color: Colors.white, size: 20),
      ),
      onPressed: () {
        setState(() {
          isClicked = !isClicked;
          widget.onTap.call();
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

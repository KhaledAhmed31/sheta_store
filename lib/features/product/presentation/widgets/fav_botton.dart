import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';

class FavBotton extends StatefulWidget {
  const FavBotton({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<FavBotton> createState() => _FavBottonState();
}

class _FavBottonState extends State<FavBotton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      style: IconButton.styleFrom(elevation: 10,),
      isSelected: isClicked,
      onPressed: () {
        setState(() {
          isClicked = !isClicked;
          widget.onTap.call();
        });
      },
      selectedIcon: CircleAvatar(
        radius: 18.r,
        backgroundColor: AppColors.main,
        child: SvgPicture.asset(
          Assets.favoriteIcon,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      icon: CircleAvatar(
        radius: 18.r,
        backgroundColor: Colors.white,
        child: SvgPicture.asset(
          Assets.favoriteIcon,
          colorFilter: ColorFilter.mode(AppColors.main, BlendMode.srcIn),
        ),
      ),
    );
  }
}

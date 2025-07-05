import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/favorite/presentation/cubit/wishlist_cubit.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key, this.isSelected, this.productId});
  final String? productId;
  final bool? isSelected;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool isClicked = widget.isSelected ?? false;
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      style: IconButton.styleFrom(
        enableFeedback: true,
        elevation: 10,
        shadowColor: const Color.fromARGB(57, 158, 158, 158),
      ),
      isSelected: isClicked,
      onPressed: () {
        setState(() {
           !isClicked
              ? BlocProvider.of<WishlistCubit>(context).addToWishlist(widget.productId!)
              : BlocProvider.of<WishlistCubit>(
                context,
              ).removeFromWishlist(widget.productId!);
          isClicked = !isClicked;
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

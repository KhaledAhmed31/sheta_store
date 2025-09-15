import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_state.dart';

class FavButton extends StatefulWidget {
  const FavButton({super.key, this.isSelected, this.productId});
  final String? productId;
  final bool? isSelected;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool isClicked;
  late WishlistCubit wishlistCubit;
  @override
  void initState() {
    wishlistCubit = getIt<WishlistCubit>();
    isClicked =
        wishlistCubit.wishlistEntity?.wishlistEnitityItem?.any(
          (element) => element.id == widget.productId,
        ) ??
        false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistCubit, WishlistState>(
      bloc: wishlistCubit,
      listener: (context, state) {
        if (state is EditeWishlistErrorState) {
          if (state.productId == widget.productId) {
            setState(() {
              isClicked = !isClicked;
            });
          }
        }else{}
      },
      child: IconButton(
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
                ? wishlistCubit.addToWishlist(widget.productId!)
                : wishlistCubit.removeFromWishlist(widget.productId!);
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
      ),
    );
  }
}

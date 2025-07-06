import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:sheta_store/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:sheta_store/features/wishlist/presentation/widgets/wishlist_card.dart';

class WishlistTap extends StatefulWidget {
  const WishlistTap({super.key});

  @override
  State<WishlistTap> createState() => _WishlistTapState();
}

class _WishlistTapState extends State<WishlistTap> {
  WishlistCubit? wishlistCubit;
  @override
  void initState() {
    wishlistCubit = BlocProvider.of<WishlistCubit>(context)..getWishlist();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WishlistTap oldWidget) {
    wishlistCubit!.getWishlist();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      builder: (context, state) {
        if (state is GetWishlistLoadingState &&
            wishlistCubit!.wishlistEntity == null) {
          return Center(
            heightFactor: 15.h,
            child: CircularProgressIndicator(color: AppColors.main),
          );
        } else if (state is GetWishlistErrorState) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(color: AppColors.main, fontSize: 20.sp),
            ),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              itemCount:
                  (wishlistCubit!.wishlistEntity!.wishlistEnitityItem ?? [])
                      .length,
              itemBuilder:
                  (context, index) => WishlistCard(
                    wishlistEnitityItem:
                        (wishlistCubit!.wishlistEntity!.wishlistEnitityItem ??
                            [])[index],
                  ),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is EditeWishlistLoadingState) {
          context.loaderOverlay.show();
        } else if (state is EditeWishlistSuccessState) {
          context.loaderOverlay.hide();
        } else if (state is GetWishlistErrorState) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.white,
            textColor: AppColors.textColor,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}

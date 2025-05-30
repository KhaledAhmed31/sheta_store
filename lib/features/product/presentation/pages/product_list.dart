import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/core/widgets/cart_button.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/search_bar.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_cubit.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_state.dart';
import 'package:sheta_store/features/product/presentation/widgets/product_item.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.catId});
  final String catId;
  final ProductCubit productCubit = getIt.get<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create:
          (context) =>
              productCubit..getProductsList(ProductRequest(categoryId: catId)),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
          ),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.main),
          ),
          title: Image.asset(
            Assets.logo3,
            height: AppHeight.h22,
            width: AppHeight.h66,
            color: AppColors.main,
            alignment: Alignment.centerLeft,
          ),
          titleSpacing: 0,
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.main),
              );
            } else if (state is ProductErrorState) {
              Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.white,
                textColor: AppColors.main,
                fontSize: 16.0,
              ).then((value) => context.pop());
              return Scaffold(backgroundColor: Colors.white);
            } else if (state is ProductSuccessState) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppMargin.m17),

                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: AppMargin.m17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [CustomSearchBar(), CartButton()],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        addAutomaticKeepAlives: false,
                        itemCount: state.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: AppMargin.m17,
                          crossAxisSpacing: AppMargin.m17,
                          crossAxisCount: 2,
                          childAspectRatio: 190.w / 237.h,
                        ),
                        itemBuilder:
                            (context, index) =>
                                ProductItem(product: state.products[index]),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

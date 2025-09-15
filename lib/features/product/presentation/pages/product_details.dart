

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sheta_store/core/assets/assets.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/core/widgets/cart_button.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/presentation/cubit/product_cubit.dart';
import 'package:sheta_store/features/product/presentation/widgets/description_section.dart';
import 'package:sheta_store/features/product/presentation/widgets/fav_botton.dart';
import 'package:sheta_store/features/product/presentation/widgets/price_cart_section.dart';
import 'package:sheta_store/features/product/presentation/widgets/ratting_sold_section.dart';
import 'package:sheta_store/features/product/presentation/widgets/title_price_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductEntity product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  ProductCubit productCubit = getIt.get<ProductCubit>();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Image.asset(
            Assets.logo3,
            height: AppHeight.h22,
            width: AppHeight.h66,
            color: AppColors.main,
            alignment: Alignment.centerLeft,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.searchIcon),
            ),
            CartButton(),
          ],
          actionsPadding: EdgeInsets.symmetric(horizontal: AppMargin.m17),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.m17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 300.h,
                width: 400.w,
                margin: EdgeInsets.only(bottom: AppMargin.m24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.stroke, width: 1),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.product.images?.length ?? 0,
                        itemBuilder:
                            (context, index) => CachedNetworkImage(
                              errorWidget:
                                  (context, url, error) =>
                                      const Icon(Icons.broken_image_rounded),
                              imageUrl: widget.product.images?[index] ?? '',
                              fit: BoxFit.contain,
                            ),
                      ),
                    ),
                    Positioned(
                      bottom: AppMargin.m8,
                      child: SmoothPageIndicator(
                        onDotClicked:
                            (index) => _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceInOut,
                            ),
                        count: widget.product.images?.length ?? 0,
                        controller: _pageController,
                        effect: SwapEffect(
                          dotColor: AppColors.main,
                          dotHeight: 7.h,
                          dotWidth: 30.w,
                          spacing: 6.w,
                          radius: 30.r,
                          paintStyle: PaintingStyle.stroke,
                          activeDotColor: AppColors.main,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: FavButton(productId: widget.product.id),
                    ),
                  ],
                ),
              ),
              TitlePriceSection(product: widget.product),
              SizedBox(height: AppMargin.m17),
              RattingSoldSection(
                product: widget.product,
                onTapQuantatyButton: (int newQuantity) {
                  setState(() {
                    quantity = newQuantity;
                  });
                },
              ),
              SizedBox(height: AppMargin.m17),
              DescriptionSection(description: widget.product.description ?? ''),
              Spacer(),
              PriceCartSection(product: widget.product, quantity: quantity),
            ],
          ),
        ),
      ),
    );
  }
}

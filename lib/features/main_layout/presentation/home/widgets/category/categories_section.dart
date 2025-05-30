import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sheta_store/core/fonts/font_size_manager.dart';
import 'package:sheta_store/core/fonts/font_style_manager.dart';
import 'package:sheta_store/core/ui/app_colors.dart';
import 'package:sheta_store/core/ui/app_height.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_error_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_loading_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_success_state.dart';
import 'package:sheta_store/features/main_layout/presentation/home/widgets/category/category_section_item.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  late CategoriesCubit categoriesCubit;
  @override
  void initState() {
    super.initState();
    categoriesCubit = BlocProvider.of<CategoriesCubit>(context);
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => categoriesCubit,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return SizedBox(
              height: AppHeight.h320,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.main),
              ),
            );
          } else if (state is CategoriesErrorState) {
            Fluttertoast.showToast(
              msg: state.errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.white,
              textColor: AppColors.main,
              fontSize: 16.0,
            );
          } else if (state is CategoriesSuccessState) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: AppMargin.m24),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppMargin.m17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: FontStyleManager.mediumStyle(
                            height: 1,
                            size: FontSizeManager.s18,
                            color: AppColors.main,
                          ),
                        ),

                        Text(
                          "View all",
                          style: FontStyleManager.regularStyle(
                            size: FontSizeManager.s12,
                            color: AppColors.main,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppHeight.h18),
                  SizedBox(
                    height: AppHeight.h320,
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: state.categories.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: AppWidth.w5,
                        crossAxisSpacing: 16,
                        mainAxisExtent: 100,
                        crossAxisCount: 2,
                      ),
                      itemBuilder:
                          (context, index) => CategorySectionItem(
                            categoryData: state.categories[index],
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

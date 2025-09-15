import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/fonts/font_size_manager.dart';
import '../../../../core/fonts/font_style_manager.dart';
import '../../../../core/ui/app_colors.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/states/categories_state.dart';
import 'sub_cat_card.dart';

class SubCategoriesList extends StatefulWidget {
  const SubCategoriesList({
    super.key,
    required this.title,
    required this.image,
    required this.catId,
  });
  final String title;
  final String image;
  final String catId;

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getSubCategories(widget.catId);
  }

  @override
  void didUpdateWidget(covariant SubCategoriesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.catId != oldWidget.catId) {
      BlocProvider.of<CategoriesCubit>(context).getSubCategories(widget.catId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 270.h,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: FontStyleManager.mediumStyle(
                color: AppColors.textColor,
                size: FontSizeManager.s14,
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: 230.w,
              height: 620.h,
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is SubCategoriesLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.main),
                    );
                  } else if (state is SubCategoriesErrorState) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 20.sp),
                      ),
                    );
                  } else if (state is SubCategoriesSuccessState) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 14.w,
                        mainAxisSpacing: 17.h,
                        mainAxisExtent: 110.h,
                      ),
                      itemBuilder:
                          (context, index) => SubCatCard(
                            image: widget.image,
                            title: state.subCategories[index].name ?? '',
                            subCatId: state.subCategories[index].id ?? '',
                          ),
                      itemCount: state.subCategories.length,
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

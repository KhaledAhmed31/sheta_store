
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dependency_injection/identifiers.dart';
import '../../../../core/ui/app_colors.dart';
import '../../../../core/ui/app_padding_margin.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/states/categories_loading_state.dart';
import '../cubit/states/categories_state.dart';
import '../cubit/states/categories_success_state.dart';
import '../widgets/select_category_bar.dart';
import '../widgets/sub_categories_list.dart';

class CategoryTap extends StatefulWidget {
  const CategoryTap({super.key});

  @override
  State<CategoryTap> createState() => _CategoryTapState();
}

class _CategoryTapState extends State<CategoryTap>
    with AutomaticKeepAliveClientMixin {
  int selectedCategory = 0;
  late CategoriesCubit categoriesCubit;
  @override
  void initState() {
    super.initState();
    categoriesCubit = getIt<CategoriesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: categoriesCubit,
      buildWhen: (previous, current) => previous != current&& current is CategoriesSuccessState || current is CategoriesLoadingState,
      builder: (context, state) {
        if (state is CategoriesSuccessState) {
       final categories = state.categories;

          return Padding(
          padding: EdgeInsets.only(
            bottom: AppMargin.m17,
            left: AppMargin.m17,
            right: AppMargin.m17,
          ),
          child: Row(
            children: [
              SelectCategoryBar(
                categories: categories,
                onTap: (p0) {
                  setState(() {
                    selectedCategory = p0;
                  });
                },
              ),
              BlocProvider(
                create: (context) => getIt<CategoriesCubit>(),
                child: SubCategoriesList(
                  title: categories[selectedCategory].name ?? '',
                  image: categories[selectedCategory].imageUrl ?? '',
                  catId: categories[selectedCategory].id ?? '',
                ),
              ),
            ],
          ),
        );
        }
        else if (state is CategoriesLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.main),
          );
        }
        else {
          return SizedBox();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

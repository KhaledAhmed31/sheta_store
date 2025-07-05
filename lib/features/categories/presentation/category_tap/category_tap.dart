import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/core/dependency_injection/identifiers.dart';
import 'package:sheta_store/core/ui/app_padding_margin.dart';
import 'package:sheta_store/features/categories/domain/entities/category_entity.dart';
import 'package:sheta_store/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_success_state.dart';
import 'package:sheta_store/features/categories/presentation/widgets/select_category_bar.dart';
import 'package:sheta_store/features/categories/presentation/widgets/sub_categories_list.dart';

class CategoryTap extends StatefulWidget {
  const CategoryTap({super.key});

  @override
  State<CategoryTap> createState() => _CategoryTapState();
}

class _CategoryTapState extends State<CategoryTap>
     {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    var state = BlocProvider.of<CategoriesCubit>(context).state;
    List<CategoryEntity> categories;
    if (state is CategoriesSuccessState) {
      categories = state.categories;
    } else {
      categories = [];
      return SizedBox();
    }
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

  
}

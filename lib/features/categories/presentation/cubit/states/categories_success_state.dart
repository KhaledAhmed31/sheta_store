import 'package:sheta_store/features/categories/domain/entities/category_model.dart';
import 'package:sheta_store/features/categories/presentation/cubit/states/categories_state.dart';

class CategoriesSuccessState implements CategoriesState{
  List<CategoryEntite> categories;

  CategoriesSuccessState({required this.categories});
}
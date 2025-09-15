import '../../../domain/entities/category_entity.dart';
import 'categories_state.dart';

class CategoriesSuccessState implements CategoriesState {
  List<CategoryEntity> categories;

  CategoriesSuccessState({required this.categories});
}

import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/categories/data/models/category_model.dart';

abstract class CategoriesRepoInterface {
  Future<(Failure?, List<CategoryModel>)> getCategories();
}

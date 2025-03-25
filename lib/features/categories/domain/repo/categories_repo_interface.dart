import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/categories/domain/entities/category_entity.dart';


abstract class CategoriesRepoInterface {
  Future<(Failure?, List<CategoryEntity>)> getCategories();
}

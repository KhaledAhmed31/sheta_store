import '../../../../core/errors/failure/failure.dart';
import '../entities/category_entity.dart';

abstract class CategoriesRepoInterface {
  Future<(Failure?, List<CategoryEntity>)> getCategories();
  Future<(Failure?, List<CategoryEntity>)> getSubCategories(String id);
}

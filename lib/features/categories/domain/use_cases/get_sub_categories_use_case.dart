import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/category_entity.dart';
import '../repo/categories_repo_interface.dart';

@singleton
class GetSubCategoriesUseCase {
    CategoriesRepoInterface categoriesRepo;
  GetSubCategoriesUseCase(this.categoriesRepo);

  Future<(Failure?, List<CategoryEntity>)> call(String id) => categoriesRepo.getSubCategories(id);
}
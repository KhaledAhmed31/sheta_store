import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/category_entity.dart';
import '../repo/categories_repo_interface.dart';

@singleton
class GetCategoriesUseCase {
  CategoriesRepoInterface categoriesRepo;

  GetCategoriesUseCase(this.categoriesRepo);
  Future<(Failure?, List<CategoryEntity>)> call() => categoriesRepo.getCategories();
}
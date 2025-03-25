import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/categories/domain/entities/category_entity.dart';
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart';

@singleton
class GetCategoriesUseCase {
  CategoriesRepoInterface categoriesRepo;

  GetCategoriesUseCase(this.categoriesRepo);
  Future<(Failure?, List<CategoryEntity>)> call() => categoriesRepo.getCategories();
}
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart';

@singleton
class GetCategoriesUseCase {
  CategoriesRepoInterface categoriesRepo;

  GetCategoriesUseCase(this.categoriesRepo);
  Future call() => categoriesRepo.getCategories();
}
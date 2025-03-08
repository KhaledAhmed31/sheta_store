import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/app_exception.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/categories/data/data_source/api/categories_remote_data_source.dart';
import 'package:sheta_store/features/categories/data/models/category_model.dart';
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart';

@LazySingleton(as: CategoriesRepoInterface)
class CategoriesRepo implements CategoriesRepoInterface {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepo({required this.categoriesRemoteDataSource});
  @override
  Future<(Failure?,List<CategoryModel>)> getCategories() async{
    try{
      var categories = await categoriesRemoteDataSource.getCategories();
      return (null,categories);
    }on AppException catch(e){
      return (Failure(message: e.message),<CategoryModel>[]);
    }
  }
}

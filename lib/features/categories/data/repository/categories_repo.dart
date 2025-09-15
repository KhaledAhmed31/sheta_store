import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../data_source/api/categories_remote_data_source.dart';
import '../models/category_model.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repo/categories_repo_interface.dart';

@LazySingleton(as: CategoriesRepoInterface)
class CategoriesRepo implements CategoriesRepoInterface {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepo({required this.categoriesRemoteDataSource});
  @override
  Future<(Failure?,List<CategoryEntity>)> getCategories() async{
    try{
      List<CategoryModel> categories = await categoriesRemoteDataSource.getCategories();
      return (null,categories);
    }on AppException catch(e){
      return (Failure(message: e.message),<CategoryEntity>[]);
    }
  }

   @override
  Future<(Failure?,List<CategoryEntity>)> getSubCategories(String id) async{
    try{
      List<CategoryModel> categories = await categoriesRemoteDataSource.getSubCategories(id);
      return (null,categories);
    }on AppException catch(e){
      return (Failure(message: e.message),<CategoryEntity>[]);
    }
  }


}

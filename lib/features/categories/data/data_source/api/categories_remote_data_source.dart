import 'package:sheta_store/features/categories/data/models/category_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getSubCategories(String id);

}

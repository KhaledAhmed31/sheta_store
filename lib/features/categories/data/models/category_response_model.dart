import 'package:sheta_store/features/categories/data/models/category_model.dart';

class CategoryResponseModel {
  final List<CategoryModel>categories;

  CategoryResponseModel.fromJson( Map<String,dynamic>json):categories=(json['data'] as List).map((e) => CategoryModel.fromJson(e)).toList();
}
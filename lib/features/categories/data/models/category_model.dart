import 'package:sheta_store/features/categories/domain/entities/category_model.dart';

class CategoryModel extends CategoryEntite{

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image'];
  }
}
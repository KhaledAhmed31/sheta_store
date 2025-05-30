import 'package:sheta_store/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];

    (json['image']==null)?imageUrl=null: imageUrl = json['image'];
  }
}

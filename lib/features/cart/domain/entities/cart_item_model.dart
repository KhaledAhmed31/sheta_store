import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class CartItemModel {
  int? count;
  String? id;
  ProductEntity? product;
  int? price;

  CartItemModel({this.count, this.id, this.product, this.price});
}
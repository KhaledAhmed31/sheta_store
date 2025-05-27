import 'package:sheta_store/features/cart/data/models/cart_response.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_item_model.dart';
import 'package:sheta_store/features/product/data/mapper/product_response_mapper.dart';

extension CartitemResponseMapper on CartItemResponse {
  CartItemModel toEntity() => CartItemModel(
    count: count,
    id: id,
    product: product?.toEntity(),
    price: price
  );
}
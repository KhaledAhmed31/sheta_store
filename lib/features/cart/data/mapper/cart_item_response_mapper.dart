import '../models/cart_response.dart';
import '../../domain/entities/cart_item_model.dart';
import '../../../product/data/mapper/product_response_mapper.dart';

extension CartitemResponseMapper on CartItemResponse {
  CartItemModel toEntity() => CartItemModel(
    count: count,
    id: id,
    product: product?.toEntity(),
    price: price
  );
}
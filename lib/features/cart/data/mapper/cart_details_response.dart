import 'package:sheta_store/features/cart/data/mapper/cart_item_response_mapper.dart';
import 'package:sheta_store/features/cart/data/models/cart_response.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_details_model.dart';

extension CartDetailsResponseMapper on CartDetailsResponse {
  CartDetailsModel toEntity() => CartDetailsModel(
    totalCartPrice: totalCartPrice,
    productItems: (productItems??[]).map((e) => e.toEntity()).toList()
  );
}
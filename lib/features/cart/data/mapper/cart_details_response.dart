import 'cart_item_response_mapper.dart';
import '../models/cart_response.dart';
import '../../domain/entities/cart_details_model.dart';

extension CartDetailsResponseMapper on CartDetailsResponse {
  CartDetailsModel toEntity() => CartDetailsModel(
    totalCartPrice: totalCartPrice,
    productItems: (productItems??[]).map((e) => e.toEntity()).toList()
  );
}
import 'cart_details_response.dart';
import '../models/cart_response.dart';
import '../../domain/entities/cart_model.dart';

extension CartResponseMapper on CartResponse {
  CartModel toEntity() => CartModel(
    cartId: cartId,
    numOfCartItems: numOfCartItems,
    cartDetails: cartDetailsResponse?.toEntity(),
  );
}
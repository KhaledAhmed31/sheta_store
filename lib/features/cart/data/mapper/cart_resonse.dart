import 'package:sheta_store/features/cart/data/mapper/cart_details_response.dart';
import 'package:sheta_store/features/cart/data/models/cart_response.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';

extension CartResponseMapper on CartResponse {
  CartModel toEntity() => CartModel(
    cartId: cartId,
    numOfCartItems: numOfCartItems,
    cartDetails: cartDetailsResponse?.toEntity(),
  );
}
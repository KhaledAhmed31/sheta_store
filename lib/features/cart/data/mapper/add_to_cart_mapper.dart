import 'package:sheta_store/features/cart/data/models/add_to_cart_response.dart';
import 'package:sheta_store/features/cart/domain/entities/Add_to_cart_model.dart';

extension AddToCartMapper on AddToCartResponse {
  AddToCartModel toEntity() => AddToCartModel(count: numOfCartItems??0 );
}
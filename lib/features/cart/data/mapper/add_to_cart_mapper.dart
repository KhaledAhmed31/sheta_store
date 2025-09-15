import '../models/add_to_cart_response.dart';
import '../../domain/entities/add_to_cart_model.dart';

extension AddToCartMapper on AddToCartResponse {
  AddToCartModel toEntity() => AddToCartModel(count: numOfCartItems??0 );
}
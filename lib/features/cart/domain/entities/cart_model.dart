import 'cart_details_model.dart';

class CartModel {
  int? numOfCartItems;
  String? cartId;
  CartDetailsModel? cartDetails;

  CartModel({this.numOfCartItems, this.cartId, this.cartDetails});
}

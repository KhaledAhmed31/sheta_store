import 'cart_item_model.dart';

class CartDetailsModel {
  int? totalCartPrice;
  List<CartItemModel>? productItems;

  CartDetailsModel({this.totalCartPrice, this.productItems});
}
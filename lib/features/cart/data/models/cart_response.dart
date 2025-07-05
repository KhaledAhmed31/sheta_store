
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:sheta_store/features/product/data/models/product_response.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartDetailsResponse? cartDetailsResponse;

  CartResponse({this.status, this.numOfCartItems, this.cartId, this.cartDetailsResponse});

  CartResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    cartDetailsResponse = json["data"] == null ? null : CartDetailsResponse.fromJson(json["data"]);
  }

}

class CartDetailsResponse {
  String? id;
  String? cartOwner;
  int? totalCartPrice;
  List<CartItemResponse>? productItems;
  String? createdAt;
  String? updatedAt;
  int? v;
  

  CartDetailsResponse({this.id, this.cartOwner, this.productItems, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});

  CartDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    productItems = json["products"] == null ? null : (json["products"] as List).map((e) => CartItemResponse.fromJson(e)).toList();
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

}

class CartItemResponse {
  int? count;
  String? id;
  ProductModel? product;
  int? price;

  CartItemResponse({this.count, this.id, this.product, this.price});

  CartItemResponse.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"] == null ? null : ProductModel.fromJson(json["product"]);
    price = json["price"];
  }

}


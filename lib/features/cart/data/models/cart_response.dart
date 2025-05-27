
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

  static List<CartResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["numOfCartItems"] = numOfCartItems;
    _data["cartId"] = cartId;
    if(cartDetailsResponse != null) {
      _data["data"] = cartDetailsResponse?.toJson();
    }
    return _data;
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

  static List<CartDetailsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartDetailsResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["cartOwner"] = cartOwner;
    if(productItems != null) {
      _data["products"] = productItems?.map((e) => e.toJson()).toList();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["totalCartPrice"] = totalCartPrice;
    return _data;
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

  static List<CartItemResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["_id"] = id;
    if(product != null) {
      _data["product"] = product?.toJson();
    }
    _data["price"] = price;
    return _data;
  }
}


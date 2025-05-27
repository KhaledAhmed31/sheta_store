
class AddToCartResponse {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  AddToCartResponse({this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  AddToCartResponse.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if(json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

}

class Data {
  String? id;
  String? cartOwner;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Data({this.id, this.cartOwner, this.products, this.createdAt, this.updatedAt, this.v, this.totalCartPrice});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
    if(json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

}

class Products {
  int? count;
  String? id;
  String? product;
  int? price;

  Products({this.count, this.id, this.product, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["count"] is int) {
      count = json["count"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["product"] is String) {
      product = json["product"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
  }

}
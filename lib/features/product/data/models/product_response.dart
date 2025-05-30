
// ignore_for_file: no_leading_underscores_for_local_identifiers

class ProductResponse {
  int? results;
  Metadata? metadata;
  List<ProductModel>? data;

  ProductResponse({this.results, this.metadata, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if(json["results"] is int) {
      results = json["results"];
    }
    if(json["metadata"] is Map) {
      metadata = json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => ProductModel.fromJson(e)).toList();
    }
  }

  static List<ProductResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if(metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ProductModel {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductModel({this.sold, this.images, this.subcategory, this.ratingsQuantity, this.id, this.title, this.slug, this.description, this.quantity, this.price, this.priceAfterDiscount, this.imageCover, this.category, this.brand, this.ratingsAverage, this.createdAt, this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["sold"] is int) {
      sold = json["sold"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["subcategory"] is List) {
      subcategory = json["subcategory"] == null ? null : (json["subcategory"] as List).map((e) => Subcategory.fromJson(e)).toList();
    }
    if(json["ratingsQuantity"] is int) {
      ratingsQuantity = json["ratingsQuantity"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["priceAfterDiscount"] is int) {
      priceAfterDiscount = json["priceAfterDiscount"];
    }
    if(json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    if(json["category"] is Map) {
      category = json["category"] == null ? null : Category.fromJson(json["category"]);
    }
    if(json["brand"] is Map) {
      brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    }
    if(json["ratingsAverage"] is double) {
      ratingsAverage = json["ratingsAverage"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["id"] is String) {
      id = json["id"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sold"] = sold;
    if(images != null) {
      _data["images"] = images;
    }
    if(subcategory != null) {
      _data["subcategory"] = subcategory?.map((e) => e.toJson()).toList();
    }
    _data["ratingsQuantity"] = ratingsQuantity;
    _data["_id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["priceAfterDiscount"] = priceAfterDiscount;
    _data["imageCover"] = imageCover;
    if(category != null) {
      _data["category"] = category?.toJson();
    }
    if(brand != null) {
      _data["brand"] = brand?.toJson();
    }
    _data["ratingsAverage"] = ratingsAverage;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["id"] = id;
    return _data;
  }
}

class Brand {
  String? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  static List<Brand> fromList(List<Map<String, dynamic>> list) {
    return list.map(Brand.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    return _data;
  }
}

class Category {
  String? id;
  String? name;
  String? slug;
  String? image;

  Category({this.id, this.name, this.slug, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  static List<Category> fromList(List<Map<String, dynamic>> list) {
    return list.map(Category.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    return _data;
  }
}

class Subcategory {
  String? id;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.id, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
  }

  static List<Subcategory> fromList(List<Map<String, dynamic>> list) {
    return list.map(Subcategory.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["category"] = category;
    return _data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if(json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if(json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
  }

  static List<Metadata> fromList(List<Map<String, dynamic>> list) {
    return list.map(Metadata.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}
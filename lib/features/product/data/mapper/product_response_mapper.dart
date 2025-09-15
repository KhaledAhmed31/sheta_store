import '../models/product_response.dart';
import '../../domain/entities/product_entity.dart';

extension ProductResponseMapper on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      categoryId: category!.id,
      title: title,
      description: description,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      ratingAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      sold: sold,
      images: images,
      imageCover: imageCover,
      quantity: quantity,
    );
  }
}

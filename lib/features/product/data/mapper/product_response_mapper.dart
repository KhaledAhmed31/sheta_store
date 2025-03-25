import 'package:sheta_store/features/product/data/models/product_response.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

extension ProductResponseMapper on ProductModel {
  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      price: price,
      priceAfterDiscount:priceAfterDiscount ,
      ratingAverage:ratingsAverage ,
      sold: sold,
      images: images,
    );
  }
} 
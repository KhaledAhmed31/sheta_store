import 'package:sheta_store/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

extension WishlistToProductEntityMapper on WishlistEnitityItem {
  ProductEntity toProductEntity() => ProductEntity(
    id: id,
    imageCover: imageCover,
    title: title,
    ratingAverage: ratingAverage,
    ratingsQuantity: ratingsQuantity,
    images: images,
    sold: sold,
    description: description,
    quantity: quantity,
    priceAfterDiscount: priceAfterDiscount,
  );
}

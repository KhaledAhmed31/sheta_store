import '../../domain/entities/wishlist_entity.dart';
import '../../../product/domain/entities/product_entity.dart';

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

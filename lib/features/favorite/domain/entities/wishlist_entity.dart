import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

class WishlistEntity {
  int? count;
  List<WishlistEnitityItem>? wishlistEnitityItem;

  WishlistEntity({this.count, this.wishlistEnitityItem});
}

class WishlistEnitityItem extends ProductEntity {
  WishlistEnitityItem({
    super.ratingsQuantity,
    super.id,
    super.title,
    super.price,
    super.imageCover,
    super.ratingAverage,
    super.images,
    super.sold,
    super.priceAfterDiscount,
    super.description,
    super.quantity,
    super.categoryId,
  });
}

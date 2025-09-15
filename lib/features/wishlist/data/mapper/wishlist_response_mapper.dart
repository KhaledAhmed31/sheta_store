import '../models/wishlist_response.dart';
import '../../domain/entities/wishlist_entity.dart';

extension WishlistResponseMapper on WishlistResponse {
  WishlistEntity toEntity() => WishlistEntity(
    count: count,
    wishlistEnitityItem:
        (wishlistItems ?? [])
            .map(
              (e) => WishlistEnitityItem(
                id: e.id,
                imageCover: e.imageCover,
                title: e.title,
                priceAfterDiscount: e.price,
                ratingAverage: e.ratingsAverage,
                ratingsQuantity: e.ratingsQuantity,
                quantity: e.quantity,
                sold: e.sold,
                description: e.description,
                images: e.images,
              ),
            )
            .toList(),
  );
}

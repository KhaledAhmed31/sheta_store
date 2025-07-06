import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/wishlist/domain/entities/wishlist_entity.dart';

abstract class WishlistRepoInterface {
  Future<Failure?> addToWishlist(String productId);
  Future<Failure?> removeFromWishlist(String productId);
  Future<(Failure?,WishlistEntity)> getWishlist();
}
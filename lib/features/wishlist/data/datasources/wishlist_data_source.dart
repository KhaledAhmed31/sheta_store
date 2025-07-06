import '../models/wishlist_response.dart';

abstract class WishlistDataSource {
  Future<void> addToWishlist(String productId);
  Future<void> removeFromWishlist(String productId);
  Future<WishlistResponse> getWishlist();
}
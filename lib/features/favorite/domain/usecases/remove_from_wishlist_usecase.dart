import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/favorite/domain/repositories/wishlist_repo_interface.dart';
@singleton

class RemoveFromWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  RemoveFromWishlistUsecase(this.wishlistRepoInterface);
  Future<Failure?> call(String productId) => wishlistRepoInterface.removeFromWishlist(productId);
}
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../repositories/wishlist_repo_interface.dart';
@singleton

class RemoveFromWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  RemoveFromWishlistUsecase(this.wishlistRepoInterface);
  Future<Failure?> call(String productId) => wishlistRepoInterface.removeFromWishlist(productId);
}
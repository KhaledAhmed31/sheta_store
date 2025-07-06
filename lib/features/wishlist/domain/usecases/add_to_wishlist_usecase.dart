import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/wishlist/domain/repositories/wishlist_repo_interface.dart';

@singleton
class AddToWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  AddToWishlistUsecase({required this.wishlistRepoInterface});

  Future<Failure?> call(String productId) => wishlistRepoInterface.addToWishlist(productId);
}
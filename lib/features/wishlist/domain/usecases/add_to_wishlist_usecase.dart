import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../repositories/wishlist_repo_interface.dart';

@singleton
class AddToWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  AddToWishlistUsecase({required this.wishlistRepoInterface});

  Future<Failure?> call(String productId) => wishlistRepoInterface.addToWishlist(productId);
}
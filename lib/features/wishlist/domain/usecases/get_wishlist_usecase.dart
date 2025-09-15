import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/wishlist_entity.dart';
import '../repositories/wishlist_repo_interface.dart';

@singleton

class GetWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  GetWishlistUsecase(this.wishlistRepoInterface); 

  Future<(Failure?,WishlistEntity?)> call() => wishlistRepoInterface.getWishlist();
}
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/wishlist/domain/entities/wishlist_entity.dart';
import 'package:sheta_store/features/wishlist/domain/repositories/wishlist_repo_interface.dart';

@singleton

class GetWishlistUsecase {
  final WishlistRepoInterface wishlistRepoInterface;
  GetWishlistUsecase(this.wishlistRepoInterface); 

  Future<(Failure?,WishlistEntity)> call() => wishlistRepoInterface.getWishlist();
}
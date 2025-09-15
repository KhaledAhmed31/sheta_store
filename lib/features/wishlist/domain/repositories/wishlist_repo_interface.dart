import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/wishlist_entity.dart';

@factoryMethod
abstract class WishlistRepoInterface {
  Future<Failure?> addToWishlist(String productId);
  Future<Failure?> removeFromWishlist(String productId);
  Future<(Failure?,WishlistEntity?)> getWishlist();
}
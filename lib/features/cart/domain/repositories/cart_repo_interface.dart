import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/domain/entities/add_to_cart_model.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';

abstract class CartRepoInterface {
  Future<(Failure?,AddToCartModel?)> addToCart(String productId);
  Future<(Failure?,CartModel?)> removeFromCart(String productId);
  Future<(Failure?,CartModel?)> updateCartQuantity(String productId, int quantity);
  Future<(Failure?,CartModel?)> getCart();
}
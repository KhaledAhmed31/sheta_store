import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/add_to_cart_model.dart';
import '../entities/cart_model.dart';

@factoryMethod
abstract class CartRepoInterface {
  Future<(Failure?,AddToCartModel?)> addToCart(String productId);
  Future<(Failure?,CartModel?)> removeFromCart(String productId);
  Future<(Failure?,CartModel?)> updateCartQuantity(String productId, int quantity);
  Future<(Failure?,CartModel?)> getCart();
}
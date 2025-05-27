import 'package:sheta_store/features/cart/data/models/add_to_cart_response.dart';
import 'package:sheta_store/features/cart/data/models/cart_response.dart';

abstract class CartDataSource {
  Future<CartResponse> getCart();
  Future<AddToCartResponse> addToCart(String productId);
  Future<CartResponse> updateCartQuantity(String productId, int quantity);
  Future<CartResponse> removeFromCart(String productId);
}
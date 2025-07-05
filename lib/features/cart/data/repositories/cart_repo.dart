import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/app_exception.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/data/datasources/cart_data_source.dart';
import 'package:sheta_store/features/cart/data/mapper/add_to_cart_mapper.dart';
import 'package:sheta_store/features/cart/data/mapper/cart_resonse.dart';
import 'package:sheta_store/features/cart/data/models/add_to_cart_response.dart';
import 'package:sheta_store/features/cart/data/models/cart_response.dart';
import 'package:sheta_store/features/cart/domain/entities/add_to_cart_model.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';
import 'package:sheta_store/features/cart/domain/repositories/cart_repo_interface.dart';

@Singleton(as: CartRepoInterface)
class CartRepo implements CartRepoInterface {
  final CartDataSource cartDataSource;
  CartRepo({required this.cartDataSource});
  @override
  Future<(Failure?, AddToCartModel?)> addToCart(String productId) async {
    try {
      AddToCartResponse cart = await cartDataSource.addToCart(productId);
      return (null,cart.toEntity());
    } on AppException catch (e) {
      return (Failure(message: e.message), null);
    }
  }

  @override
  Future<(Failure?, CartModel?)> getCart() async {
    try {
      CartResponse cart = await cartDataSource.getCart();
      return (null, cart.toEntity());
    } on AppException catch (e) {
      return (Failure(message: e.message), null);
    }
  }

  @override
  Future<(Failure?, CartModel?)> removeFromCart(String productId) async {
    try {
      CartResponse cart = await cartDataSource.removeFromCart(productId);
      return (null,cart.toEntity());
    } on AppException catch (e) {
      return (Failure(message: e.message),null );
    }
  }

  @override
  Future<(Failure?, CartModel?)> updateCartQuantity(
    String productId,
    int quantity,
  ) async {
    try {
      CartResponse cart = await cartDataSource.updateCartQuantity(productId, quantity);
      return (null,cart.toEntity() );
    } on AppException catch (e) {
      return (Failure(message: e.message), null);
    }
  }
}

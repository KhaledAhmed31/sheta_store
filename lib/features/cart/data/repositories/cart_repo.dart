import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../datasources/cart_data_source.dart';
import '../mapper/add_to_cart_mapper.dart';
import '../mapper/cart_resonse.dart';
import '../models/add_to_cart_response.dart';
import '../models/cart_response.dart';
import '../../domain/entities/add_to_cart_model.dart';
import '../../domain/entities/cart_model.dart';
import '../../domain/repositories/cart_repo_interface.dart';

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

import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/domain/entities/add_to_cart_model.dart';
import 'package:sheta_store/features/cart/domain/repositories/cart_repo_interface.dart';

@singleton
class AddToCartUseCase {
  final CartRepoInterface cartRepoInterface;
  AddToCartUseCase( this.cartRepoInterface);

  Future<(Failure?,AddToCartModel?)> call(String productId) async => await cartRepoInterface.addToCart(productId);
}
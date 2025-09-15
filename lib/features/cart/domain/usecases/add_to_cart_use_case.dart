import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/add_to_cart_model.dart';
import '../repositories/cart_repo_interface.dart';

@singleton
class AddToCartUseCase {
  final CartRepoInterface cartRepoInterface;
  AddToCartUseCase( this.cartRepoInterface);

  Future<(Failure?,AddToCartModel?)> call(String productId) async => await cartRepoInterface.addToCart(productId);
}
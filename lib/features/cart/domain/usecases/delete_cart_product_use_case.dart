import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/cart_model.dart';
import '../repositories/cart_repo_interface.dart';

@singleton
class DeleteCartProductUseCase {
  final CartRepoInterface cartRepoInterface;

  DeleteCartProductUseCase(this.cartRepoInterface);

  Future<(Failure?, CartModel?)> call( String productId) async => await cartRepoInterface.removeFromCart(productId);
}
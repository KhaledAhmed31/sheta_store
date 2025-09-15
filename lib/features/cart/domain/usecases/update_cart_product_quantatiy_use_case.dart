import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/cart_model.dart';
import '../repositories/cart_repo_interface.dart';

@singleton
class UpdateCartProductQuantatiyUseCase {
  final CartRepoInterface cartRepoInterface;

  UpdateCartProductQuantatiyUseCase( this.cartRepoInterface);

  Future<(Failure?, CartModel?)> call( String productId, int quantity) async =>
      await cartRepoInterface.updateCartQuantity(productId, quantity);
}

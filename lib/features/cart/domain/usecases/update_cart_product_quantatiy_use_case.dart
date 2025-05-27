import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';
import 'package:sheta_store/features/cart/domain/repositories/cart_repo_interface.dart';

@singleton
class UpdateCartProductQuantatiyUseCase {
  final CartRepoInterface cartRepoInterface;

  UpdateCartProductQuantatiyUseCase( this.cartRepoInterface);

  Future<(Failure?, CartModel?)> call( String productId, int quantity) async =>
      await cartRepoInterface.updateCartQuantity(productId, quantity);
}

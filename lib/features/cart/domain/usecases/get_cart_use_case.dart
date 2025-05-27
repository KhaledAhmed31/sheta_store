import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/cart/domain/entities/cart_model.dart';
import 'package:sheta_store/features/cart/domain/repositories/cart_repo_interface.dart';

@singleton
class GetCartUseCase {
  final CartRepoInterface cartRepoInterface;
  GetCartUseCase( this.cartRepoInterface);
  Future<(Failure?,CartModel?)> call() async => await cartRepoInterface.getCart();
}
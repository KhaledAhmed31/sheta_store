import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/cart_model.dart';
import '../repositories/cart_repo_interface.dart';

@singleton
class GetCartUseCase {
  final CartRepoInterface cartRepoInterface;
  GetCartUseCase( this.cartRepoInterface);
  Future<(Failure?,CartModel?)> call() async => await cartRepoInterface.getCart();
}
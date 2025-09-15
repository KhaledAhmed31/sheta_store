import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repo_interface.dart';

@singleton
class GetProductDetails {
  final ProductRepoInterface productRepoInterface;
  GetProductDetails(this.productRepoInterface);

  Future<(Failure?, ProductEntity)> call(String productId) => productRepoInterface.getProductDetail(productId);
}
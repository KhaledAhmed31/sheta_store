import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/domain/repositories/product_repo_interface.dart';

@singleton
class GetProductDetails {
  final ProductRepoInterface productRepoInterface;
  GetProductDetails(this.productRepoInterface);

  Future<(Failure?, ProductEntity)> call(String productId) => productRepoInterface.getProductDetail(productId);
}
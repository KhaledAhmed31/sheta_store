import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';
import 'package:sheta_store/features/product/domain/repositories/product_repo_interface.dart';

@singleton
class  GetProductsList {
  final ProductRepoInterface productRepoInterface;

  GetProductsList(this.productRepoInterface);

  Future<(Failure?, List<ProductEntity>)> call(ProductRequest productRequest) => productRepoInterface.getProductsList(productRequest);
}
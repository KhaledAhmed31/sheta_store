import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';
import 'package:sheta_store/features/product/domain/entities/product_entity.dart';

abstract class ProductRepoInterface {
  Future<(Failure?, List<ProductEntity>)> getProductsList(ProductRequest productRequest);
  Future<(Failure?, ProductEntity)> getProductDetail(String productId);
}

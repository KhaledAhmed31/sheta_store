import '../../../../core/errors/failure/failure.dart';
import '../../data/models/product_request.dart';
import '../entities/product_entity.dart';

abstract class ProductRepoInterface {
  Future<(Failure?, List<ProductEntity>)> getProductsList(ProductRequest productRequest);
  Future<(Failure?, ProductEntity)> getProductDetail(String productId);
}

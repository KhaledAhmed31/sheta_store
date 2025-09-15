import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../data%20sources/products_data_source.dart';
import '../mapper/product_response_mapper.dart';
import '../models/product_request.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repo_interface.dart';

@Singleton(as: ProductRepoInterface)
class ProductRepo extends ProductRepoInterface {
  ProductsDataSource productDataSource;

  ProductRepo({required this.productDataSource});

  @override
  Future<(Failure?, List<ProductEntity>)> getProductsList(
    ProductRequest productRequest,
  ) async {
    try {
      var products = await productDataSource.getProductsList(productRequest);
      return (null, products.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return (Failure(message: e.message), <ProductEntity>[]);
    }
  }

  @override
  Future<(Failure?, ProductEntity)> getProductDetail(String productId) async {
    try {
      var products = await productDataSource.getProductDetail(productId);
      return (null, products.toEntity());
    } on AppException catch (e) {
      return (Failure(message: e.toString()), ProductEntity());
    }
  }
}

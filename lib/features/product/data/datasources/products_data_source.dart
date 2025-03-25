import 'package:sheta_store/features/product/data/models/product_response.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProductsList(ProductRequest productRequest);
  Future<ProductModel> getProductDetail(String productId);
}
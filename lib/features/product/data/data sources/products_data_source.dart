import '../models/product_response.dart';
import '../models/product_request.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProductsList(ProductRequest productRequest);
  Future<ProductModel> getProductDetail(String productId);
}
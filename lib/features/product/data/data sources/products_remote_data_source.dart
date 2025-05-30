import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/errors/remote_errors_handler/remote_errors_handler.dart';
import 'package:sheta_store/features/product/data/data%20sources/products_data_source.dart';
import 'package:sheta_store/features/product/data/models/product_response.dart';
import 'package:sheta_store/features/product/data/models/product_request.dart';

@Singleton(as: ProductsDataSource)
class ProductsRemoteDataSource implements ProductsDataSource {
  final Dio dio;

  ProductsRemoteDataSource({required this.dio});

  @override
  Future<List<ProductModel>> getProductsList(
    ProductRequest productRequest,
  ) async {
    try {
      var response = await dio.get(
        ApiConstants.products,
        queryParameters: productRequest.toJson(),
      );
      return (ProductResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      String messege = e.toString();
      if (e is DioException) {
        messege = e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

  @override
  Future<ProductModel> getProductDetail(String productId) async {
    try {
      var response = await dio.get(
        ApiConstants.products,
        queryParameters: {"id": productId},
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      String messege = e.toString();
      if (e is DioException) {
        messege = e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }
}

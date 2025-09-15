
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/constants/api/api_constants.dart';
import '../../../../../core/errors/remote_errors_handler/remote_errors_handler.dart';
import 'categories_remote_data_source.dart';
import '../../models/category_model.dart';
import '../../models/category_response_model.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesApiDataSource implements CategoriesRemoteDataSource {
  final Dio dio;
  CategoriesApiDataSource(this.dio);
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await dio.get(ApiConstants.categories);
      return CategoryResponseModel.fromJson(response.data).categories;
    } catch (e) {
      String messege = e.toString();
      if (e is DioException) {
        messege = e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories(String id) async {
    try {
      var response = await dio.get("${ApiConstants.categories}/$id${ApiConstants.subCategories}");
      return CategoryResponseModel.fromJson(response.data).categories;
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response?.data["message"] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: message);
    }
  }
}

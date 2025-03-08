import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/errors/remote_errors_handler/remote_errors_handler.dart';
import 'package:sheta_store/features/categories/data/data_source/api/categories_remote_data_source.dart';
import 'package:sheta_store/features/categories/data/models/category_model.dart';
import 'package:sheta_store/features/categories/data/models/category_response_model.dart';

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
        messege = e.response!.data['message'];
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }
}

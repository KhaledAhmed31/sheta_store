import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/errors/remote_errors_handler/remote_errors_handler.dart';
import 'package:sheta_store/features/cart/data/datasources/cart_data_source.dart';
import 'package:sheta_store/features/cart/data/models/add_to_cart_response.dart';
import 'package:sheta_store/features/cart/data/models/cart_response.dart';

@Singleton(as:CartDataSource)
class CartRemoteDataSource  implements CartDataSource {
  final Dio dio;
  CartRemoteDataSource(this.dio);
  @override
  Future<AddToCartResponse> addToCart(String productId) async{
    try {
      return await dio.post(ApiConstants.cart, data: {"productId": productId},).then((value) => AddToCartResponse.fromJson(value.data));
       
    } catch (e) {
      String messege = e.toString();
      if(e is DioException){
        messege =e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

 

  @override
  Future<CartResponse> removeFromCart(String productId) async{
    try{
      return await dio.delete("${ApiConstants.cart}/$productId").then((value) => CartResponse.fromJson(value.data));
    }catch(e){
      String messege = e.toString();
      if(e is DioException){
        messege =e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

  @override
  Future<CartResponse> updateCartQuantity(String productId, int quantity) async{
    try{
     return await dio.put("${ApiConstants.cart}/$productId",data: {"count":quantity}).then((value) => CartResponse.fromJson(value.data));
      
    }catch(e){
      String messege = e.toString();
      if(e is DioException){
        messege =e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

  @override
  Future<CartResponse> getCart() async{
    try{
      return await dio.get(ApiConstants.cart).then((value) => CartResponse.fromJson(value.data));
    }catch(e){
      String messege = e.toString();
      if(e is DioException){
        messege =e.response?.data['message'] ?? "some thing went wrong";
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }
}

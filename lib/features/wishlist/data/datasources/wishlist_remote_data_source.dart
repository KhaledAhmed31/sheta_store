
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/errors/remote_errors_handler/remote_errors_handler.dart';
import '../models/wishlist_response.dart';
import 'wishlist_data_source.dart';

@Singleton(as: WishlistDataSource)
class WishlistRemoteDataSource implements WishlistDataSource {
  final Dio dio;
  WishlistRemoteDataSource({required this.dio});

  @override
  Future<void> addToWishlist(String productId)async {
    try{
      await dio.post(ApiConstants.wishlist, data: {'productId': productId});
    }
    catch(e){
      String message = e.toString();
      if(e is DioException){
        message = e.response!.data['message']??"something went wrong";
      }
      throw RemoteErrorsHandler(message: message);
    }
  }

  @override
  Future<WishlistResponse> getWishlist()async {
    try{
      return await dio.get(ApiConstants.wishlist).then((value) => WishlistResponse.fromJson(value.data));
    }
    catch(e){
      String message = e.toString();
      if(e is DioException){
        message = e.response!.data['message']??"something went wrong";
      }
      throw RemoteErrorsHandler(message: message);
    }
  }

  @override
  Future<void> removeFromWishlist(String productId) async{
    try{
      await dio.delete("${ApiConstants.wishlist}/$productId");
    }
    catch(e){
      String message = e.toString();
      if(e is DioException){
        message = e.response!.data['message']??"something went wrong";
      }
      throw RemoteErrorsHandler(message: message);
    }
  
  }
}

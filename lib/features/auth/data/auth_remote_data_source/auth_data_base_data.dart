import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_response.dart';
import 'package:sheta_store/features/auth/data/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/errors/auth_errors_handlers/auth/auth_error_handler.dart';
import 'package:sheta_store/core/errors/remote_errors_handler/remote_errors_handler.dart';
@Singleton(as: AuthRemoteData)
class AuthDataBaseData implements AuthRemoteData {
  final Dio dio ;

  AuthDataBaseData({required this.dio});
  @override
  Future<SignInResponse> signIn(SignInParams signInParams) async {
    try {
      var response =
          await dio.post(ApiConstants.signIn, data: signInParams.toJson());
      return SignInResponse.fromJson(response.data);
    } catch (e) {
      String messege = e.toString();
      if (e is DioException) {
        messege = e.response!.data['message'];
        throw AuthErrorHandler(message: messege);
      }
      throw RemoteErrorsHandler(message: messege);
    }
  }

  @override
  Future<void> signUp(SignUpParams signUpModel) async {
    try {
      await dio.post(ApiConstants.signUp, data: signUpModel.toJson());
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        message = e.response!.data['message'];
        throw AuthErrorHandler(message: message);
      }
      throw RemoteErrorsHandler(message: message);
    }
  }
}

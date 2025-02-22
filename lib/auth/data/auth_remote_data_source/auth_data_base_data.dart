import 'package:sheta_store/auth/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:sheta_store/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/auth/data/models/sign_in_response.dart';
import 'package:sheta_store/auth/data/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:sheta_store/common/constants/api/api_constants.dart';
class AuthDataBaseData implements AuthRemoteData {

  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl ));
  @override
  Future<SignInResponse> signIn(SignInParams signInParams)async {
    var response =await dio.post(ApiConstants.signIn,data: signInParams.toJson());
    return SignInResponse.fromJson(response.data);
  }

  @override
  Future<void> signUp(SignUpParams signUpModel) {
    return dio.post(ApiConstants.signUp,data: signUpModel.toJson());
    

  }
}

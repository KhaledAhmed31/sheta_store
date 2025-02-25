import 'package:sheta_store/auth/data/auth_local_data.dart/aurh_local_data.dart';
import 'package:sheta_store/auth/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:sheta_store/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/auth/data/models/sign_in_response.dart';
import 'package:sheta_store/auth/data/models/sign_up_model.dart';
import 'package:sheta_store/auth/data/models/user_model.dart';

class AuthRepo {
  AuthRemoteData authRemoteData;
  AuthLocalData authLocalData;
  AuthRepo({required this.authRemoteData, required this.authLocalData});

  Future<User> signIn(SignInParams signInParams) async {
    SignInResponse response = await authRemoteData.signIn(signInParams);
    await authLocalData.saveToken(response.token);
    return response.user;
  }

  Future<void> signUp(SignUpParams signUpModel) =>
      authRemoteData.signUp(signUpModel);
}

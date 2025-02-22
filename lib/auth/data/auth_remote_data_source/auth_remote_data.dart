import 'package:sheta_store/auth/data/models/sign_in_response.dart';
import 'package:sheta_store/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/auth/data/models/sign_up_model.dart';

abstract class AuthRemoteData {
  Future<SignInResponse> signIn(SignInParams signInParams);
  Future<void> signUp(SignUpParams signUpModel);
}

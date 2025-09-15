import '../models/sign_in_response.dart';
import '../models/sign_in_params.dart';
import '../models/sign_up_model.dart';

abstract class AuthRemoteData {
  Future<SignInResponse> signIn(SignInParams signInParams);
  Future<void> signUp(SignUpParams signUpModel);
}

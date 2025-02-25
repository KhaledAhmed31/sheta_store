import 'package:sheta_store/auth/sign_in/presentation/cubit/states/sign_in_state.dart';

class SignInErrorState implements AuthState {
  String errorMessage;
  SignInErrorState() : errorMessage = "Username or Password is not correct";
}

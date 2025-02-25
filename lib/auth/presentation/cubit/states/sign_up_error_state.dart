import 'package:sheta_store/auth/sign_in/presentation/cubit/states/sign_in_state.dart';

class SignUpErrorState implements AuthState {
  String errorMessage;
  SignUpErrorState() : errorMessage = "Username or Password is not correct";
}

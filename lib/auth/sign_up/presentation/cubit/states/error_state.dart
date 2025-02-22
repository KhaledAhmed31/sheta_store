import 'package:sheta_store/auth/sign_up/presentation/cubit/states/sign_in_state.dart';

class SignUpErrorState implements SignUpState {
  String errorMessage;
  SignUpErrorState() : errorMessage = "Username or Password is not correct";
}


import 'package:sheta_store/features/auth/presentation/cubit/states/sign_in_state.dart';

class SignUpErrorState implements AuthState {
  String errorMessage;
  SignUpErrorState({this.errorMessage = "Username or Password is not correct"}) ;
}

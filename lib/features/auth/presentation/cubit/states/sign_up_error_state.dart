
import 'sign_in_state.dart';

class SignUpErrorState implements AuthState {
  String errorMessage;
  SignUpErrorState({this.errorMessage = "Username or Password is not correct"}) ;
}

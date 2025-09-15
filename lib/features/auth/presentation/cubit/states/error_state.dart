
import 'sign_in_state.dart';

class SignInErrorState implements AuthState {
  String errorMessage;
  SignInErrorState({this.errorMessage = "Username or Password is not correct"});
}

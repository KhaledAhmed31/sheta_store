import 'package:sheta_store/auth/data/models/user_model.dart';

class SignInResponse {
  String message;
  User user;
  String token;

  SignInResponse(
      {required this.message, required this.user, required this.token});

  SignInResponse.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        user = User.fromJson(json["user"]),
        token = json["token"];

  

  
}

import 'user_model.dart';

class SignInResponse {
  String message;
  UserModel user;
  String token;

  SignInResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  SignInResponse.fromJson(Map<String, dynamic> json)
    : message = json["message"],
      user = UserModel.fromJson(json["user"]),
      token = json["token"];
}

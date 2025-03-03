import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';

class UserModel extends UserEntite {
  UserModel({super.name, super.email, super.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
  }
}

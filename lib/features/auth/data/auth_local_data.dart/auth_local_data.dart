
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';

abstract class AuthLocalData {
  Future<void> saveToken(String token);
  Future<bool> signOut();
  String? getToken();
  Future<void> saveUser(UserEntite user);
  Map<String,dynamic>getUser();


}

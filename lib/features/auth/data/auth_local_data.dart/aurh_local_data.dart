
abstract class AuthLocalData {
  Future<void> saveToken(String token);
  Future<bool> signOut();
  String? getToken();


}

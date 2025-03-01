
abstract class AuthLocalData {
  Future<void> saveToken(String token);
  String? getToken();
}

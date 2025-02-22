
abstract class AuthLocalData {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheta_store/auth/data/auth_local_data.dart/aurh_local_data.dart';
import 'package:sheta_store/common/constants/shared_preferences/shared_preferences.dart';

class AuthCacheData implements AuthLocalData {
  @override
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesKeys.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferencesKeys.tokenKey);
  }
}

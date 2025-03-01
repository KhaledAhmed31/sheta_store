import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_local_data.dart';
import 'package:sheta_store/core/constants/shared_preferences/shared_preferences.dart';
import 'package:sheta_store/core/errors/local_error_handler/local_error_handler.dart';

@Singleton(as: AuthLocalData)
class AuthCacheData implements AuthLocalData {
  final SharedPreferences prefs;

  AuthCacheData(this.prefs);

  @override
  Future<void> saveToken(String token) async {
    try {
      await prefs.setString(SharedPreferencesKeys.tokenKey, token);
    } catch (e) {
      throw LocalErrorHandler(message: e.toString());
    }
  }

  @override
  String? getToken() {
    try {
      return prefs.getString(SharedPreferencesKeys.tokenKey);
    } catch (e) {
      throw LocalErrorHandler(message: e.toString());
    }
  }
}

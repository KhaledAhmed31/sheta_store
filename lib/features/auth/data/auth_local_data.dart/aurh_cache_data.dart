import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_local_data.dart';
import 'package:sheta_store/core/constants/shared_preferences/shared_preferences.dart';
import 'package:sheta_store/core/errors/local_error_handler/local_error_handler.dart';

class AuthCacheData implements AuthLocalData {
  @override
  Future<void> saveToken(String token) async {
    try{SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPreferencesKeys.tokenKey, token);}catch(e){
      throw LocalErrorHandler(message:e.toString());
    }
  }

  @override
  Future<String?> getToken() async {
   try{ SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPreferencesKeys.tokenKey);}catch(e){
      
      throw LocalErrorHandler(message:e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';
import 'package:sheta_store/core/constants/shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  // url here will be injected
  @lazySingleton
  Dio get dio {
    Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        var sharedPreferences = await SharedPreferences.getInstance();
        String? token = sharedPreferences.getString(SharedPreferencesKeys.tokenKey);
        if (token != null) {
          options.headers['token'] = token;
        }
        
        return handler.next(options);
      },
    ));
    return dio;
  }

  // same thing works for instances that's gotten asynchronous.
  // all you need to do is wrap your instance with a future and tell injectable how
  // to initialize it
  @preResolve // if you need to pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  // Also, make sure you await for your configure function before running the App.
}

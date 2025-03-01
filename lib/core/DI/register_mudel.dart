import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sheta_store/core/constants/api/api_constants.dart';

@module  
abstract class RegisterModule {  
 // You can register named preemptive types like follows  
  // url here will be injected  
  @lazySingleton  
  Dio dio() => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));  
  
  // same thing works for instances that's gotten asynchronous.  
  // all you need to do is wrap your instance with a future and tell injectable how  
  // to initialize it  
  @preResolve // if you need to pre resolve the value  
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();  
  // Also, make sure you await for your configure function before running the App.  
}
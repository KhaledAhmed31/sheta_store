import 'package:injectable/injectable.dart';
import '../auth_local_data.dart/auth_local_data.dart';
import '../auth_remote_data_source/auth_remote_data.dart';
import '../models/sign_in_params.dart';
import '../models/sign_in_response.dart';
import '../models/sign_up_model.dart';
import '../../../../core/errors/app_exception.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../domain/entities/user_entite.dart';
import '../../domain/repo/auth_repo_interface.dart';

@Singleton(as: AuthRepoInterface)
class AuthRepo implements AuthRepoInterface {
  AuthRemoteData authRemoteData;
  AuthLocalData authLocalData;
  AuthRepo({required this.authRemoteData, required this.authLocalData});
  @override
  Future<(Failure?, UserEntite?)> signIn(SignInParams signInParams) async {
    try {
      SignInResponse response = await authRemoteData.signIn(signInParams);
      await authLocalData.saveToken(response.token);
      return (null, response.user);
    } on AppException catch (e) {
      return (Failure(message: e.message), null);
    }
  }

  @override
  Future<Failure?> signUp(SignUpParams signUpModel) async {
    try {
      await authRemoteData.signUp(signUpModel);
      return null;
    } on AppException catch (e) {
      return Failure(message: e.message);
    }
  }

  @override
  Future<bool> signOut() async {
   return await authLocalData.signOut();
  }
  
  @override
  bool isSigned() {
    return authLocalData.getToken() != null;
  }
  @override
  Future<void> saveUser(UserEntite user) async {
    await authLocalData.saveUser(user);
  }

  @override
  UserEntite getUser(){
    return UserEntite(
        name: authLocalData.getUser()["name"],
        email: authLocalData.getUser()["email"]);
  }
}

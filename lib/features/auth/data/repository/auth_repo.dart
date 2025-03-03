import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_local_data.dart';
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_response.dart';
import 'package:sheta_store/features/auth/data/models/sign_up_model.dart';
import 'package:sheta_store/core/errors/app_exception.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

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
}

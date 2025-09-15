import '../../../../core/errors/failure/failure.dart';
import '../../data/models/sign_in_params.dart';
import '../../data/models/sign_up_model.dart';
import '../entities/user_entite.dart';

abstract class AuthRepoInterface {
  Future<(Failure?, UserEntite?)> signIn(SignInParams signupParams);
  Future<Failure?> signUp(SignUpParams signupParams);
  bool isSigned();
  Future<bool> signOut();
  Future <void> saveUser(UserEntite user);
  UserEntite getUser();
}

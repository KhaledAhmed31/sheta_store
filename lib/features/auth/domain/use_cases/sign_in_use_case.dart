import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/models/sign_in_params.dart';
import '../entities/user_entite.dart';
import '../repo/auth_repo_interface.dart';

@singleton
class SignInUseCase {
  final AuthRepoInterface authRepoInterface;
  SignInUseCase({required this.authRepoInterface});

  Future<(Failure?, UserEntite?)> call(SignInParams signupParams) =>
      authRepoInterface.signIn(signupParams);
}

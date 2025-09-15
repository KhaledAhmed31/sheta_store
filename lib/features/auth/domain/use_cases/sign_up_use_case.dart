import 'package:injectable/injectable.dart';
import '../../../../core/errors/failure/failure.dart';
import '../../data/models/sign_up_model.dart';
import '../repo/auth_repo_interface.dart';

@singleton

class SignUpUseCase {
  final AuthRepoInterface authRepoInterface;

  SignUpUseCase({required this.authRepoInterface});

  Future<Failure?> call(SignUpParams signupParams) => authRepoInterface.signUp(signupParams);
}
import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/auth/data/models/sign_up_model.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

@singleton

class SignUpUseCase {
  final AuthRepoInterface authRepoInterface;

  SignUpUseCase({required this.authRepoInterface});

  Future<Failure?> call(SignUpParams signupParams) => authRepoInterface.signUp(signupParams);
}
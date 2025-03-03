import 'package:injectable/injectable.dart';
import 'package:sheta_store/core/errors/failure/failure.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

@singleton

class SignInUseCase {
  final AuthRepoInterface authRepoInterface;
  SignInUseCase({required this.authRepoInterface});

  Future<(Failure?, UserEntite?)> call(SignInParams signupParams) => authRepoInterface.signIn(signupParams);
}
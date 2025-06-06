import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

@singleton

class SignOutUseCase {
  final AuthRepoInterface authRepoInterface;
  SignOutUseCase({required this.authRepoInterface});

  Future<bool> call() => authRepoInterface.signOut();
}
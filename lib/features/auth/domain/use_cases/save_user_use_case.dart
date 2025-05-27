import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

@singleton
class SaveUserUseCase {
  AuthRepoInterface authRepoInterface;
  SaveUserUseCase(this.authRepoInterface);

  Future<void> call(UserEntite user) => authRepoInterface.saveUser(user);
}
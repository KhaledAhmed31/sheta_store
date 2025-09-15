import 'package:injectable/injectable.dart';
import '../entities/user_entite.dart';
import '../repo/auth_repo_interface.dart';

@singleton
class SaveUserUseCase {
  AuthRepoInterface authRepoInterface;
  SaveUserUseCase(this.authRepoInterface);

  Future<void> call(UserEntite user) => authRepoInterface.saveUser(user);
}
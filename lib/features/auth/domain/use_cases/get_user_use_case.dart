import 'package:injectable/injectable.dart';
import '../entities/user_entite.dart';
import '../repo/auth_repo_interface.dart';
@singleton
class GetUserUseCase {
  final AuthRepoInterface authRepoInterface;
  GetUserUseCase( this.authRepoInterface);
  UserEntite call() => authRepoInterface.getUser();
}
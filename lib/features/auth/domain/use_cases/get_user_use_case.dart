import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';
@singleton
class GetUserUseCase {
  final AuthRepoInterface authRepoInterface;
  GetUserUseCase( this.authRepoInterface);
  UserEntite call() => authRepoInterface.getUser();
}
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart';

@singleton
class CheckTokenUseCase {
  final AuthRepoInterface authRepoInterface;

  CheckTokenUseCase(this.authRepoInterface);
  bool call() => authRepoInterface.isSigned();
}
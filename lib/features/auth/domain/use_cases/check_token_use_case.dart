import 'package:injectable/injectable.dart';
import '../repo/auth_repo_interface.dart';

@singleton
class CheckTokenUseCase {
  final AuthRepoInterface authRepoInterface;

  CheckTokenUseCase(this.authRepoInterface);
  bool call() => authRepoInterface.isSigned();
}
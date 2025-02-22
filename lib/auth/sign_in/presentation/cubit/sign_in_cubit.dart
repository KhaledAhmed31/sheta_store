import 'package:sheta_store/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/auth/repository/auth_repo.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/error_state.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/initial_state.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/loading_state.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/sign_in_state.dart';
import 'package:sheta_store/auth/sign_in/presentation/cubit/states/success_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/common/constants/auth_data_identifiers/auth_data_identifiers.dart';

class SignInCubit extends Cubit<SignInState> {
  AuthRepo authRepo;
  SignInCubit()
      : authRepo = AuthRepo(
            authRemoteData: AuthDataIdentifiers.dataBase,
            authLocalData: AuthDataIdentifiers.cache),
        super(SignInInitialState());

  Future<void> signIn(SignInParams signupParams) async {
    emit(SignInLoadingState());
    print("loading");
    try {
      await authRepo.signIn(signupParams);
      print("success");
      emit(SignInSuccessState());
    } catch (e) {
      print(e.toString());
      emit(SignInErrorState());
    }
  }
}

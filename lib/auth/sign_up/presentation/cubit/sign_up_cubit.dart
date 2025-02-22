import 'package:sheta_store/auth/data/models/sign_up_model.dart';
import 'package:sheta_store/auth/repository/auth_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/auth/sign_up/presentation/cubit/states/error_state.dart';
import 'package:sheta_store/auth/sign_up/presentation/cubit/states/initial_state.dart';
import 'package:sheta_store/auth/sign_up/presentation/cubit/states/loading_state.dart';
import 'package:sheta_store/auth/sign_up/presentation/cubit/states/sign_in_state.dart';
import 'package:sheta_store/auth/sign_up/presentation/cubit/states/success_state.dart';
import 'package:sheta_store/common/constants/auth_data_identifiers/auth_data_identifiers.dart';

class SignUpCubit extends Cubit<SignUpState> {
  AuthRepo authRepo;
  SignUpCubit()
      : authRepo = AuthRepo(
            authRemoteData: AuthDataIdentifiers.dataBase,
            authLocalData: AuthDataIdentifiers.cache),
        super(SignUpInitialState());

  Future<void> signUp(SignUpParams signupParams) async {
    emit(SignUpLoadingState());
    print("loading");
    try {
      await authRepo.signUp(signupParams);
      print("success");
      emit(SignUpSuccessState());
    } catch (e) {
      print(e.toString());
      emit(SignUpErrorState());
    }
  }
}

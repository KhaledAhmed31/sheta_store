import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/data/repository/auth_repo.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/initial_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/loading_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_in_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_loading_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_success_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/success_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sheta_store/core/constants/auth_data_identifiers/auth_data_identifiers.dart';

import '../../data/models/sign_up_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo authRepo;
  AuthCubit()
      : authRepo = AuthRepo(
            authRemoteData: AuthDataIdentifiers.dataBase,
            authLocalData: AuthDataIdentifiers.cache),
        super(SignInInitialState());

  Future<void> signIn(SignInParams signupParams) async {
    emit(SignInLoadingState());
    var response = await authRepo.signIn(signupParams);
    if (response.$1 == null) {
      emit(SignInSuccessState());
    }else{
      emit(SignInErrorState( errorMessage: response.$1!.message));
    }
    
  }

  Future<void> signUp(SignUpParams signupParams) async {
    emit(SignUpLoadingState());

    var response=await authRepo.signUp(signupParams);
    if(response==null){
      emit(SignUpSuccessState());
    }else{
      emit(SignUpErrorState( errorMessage: response.message));
    }

  }
}

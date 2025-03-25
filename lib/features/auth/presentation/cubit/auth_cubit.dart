
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/domain/use_cases/check_token_use_case.dart';
import 'package:sheta_store/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:sheta_store/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:sheta_store/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/initial_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/loading_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_in_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_error_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_loading_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/sign_up_success_state.dart';
import 'package:sheta_store/features/auth/presentation/cubit/states/success_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/sign_up_model.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final CheckTokenUseCase checkTokenUseCase;
  AuthCubit( this.signInUseCase, this.signUpUseCase, this.signOutUseCase, this.checkTokenUseCase) : super(SignInInitialState());

  Future<void> signIn(SignInParams signInParams) async {
    emit(SignInLoadingState());
    var response = await signInUseCase(signInParams);
    if (response.$1 == null) {
      emit(SignInSuccessState());
    } else {
      emit(SignInErrorState(errorMessage: response.$1!.message));
    }
  }

  Future<void> signUp(SignUpParams signInParams) async {
    emit(SignUpLoadingState());

    var response = await signUpUseCase(signInParams);
    if (response == null) {
      emit(SignUpSuccessState());
    } else {
      emit(SignUpErrorState(errorMessage: response.message));
    }
  }

  Future<void> signOut() async {
    await signOutUseCase();
  }

  bool checkToken()  {
    bool isSigned = checkTokenUseCase();
    if(isSigned){
      emit(SignInSuccessState());
    }
    return isSigned;
  }
}

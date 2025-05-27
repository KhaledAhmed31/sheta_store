
import 'package:injectable/injectable.dart';
import 'package:sheta_store/features/auth/data/models/sign_in_params.dart';
import 'package:sheta_store/features/auth/domain/entities/user_entite.dart';
import 'package:sheta_store/features/auth/domain/use_cases/check_token_use_case.dart';
import 'package:sheta_store/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:sheta_store/features/auth/domain/use_cases/save_user_use_case.dart';
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
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final CheckTokenUseCase _checkTokenUseCase;
  final GetUserUseCase _getUserUseCase;
  final SaveUserUseCase _saveUserUseCase;
  AuthCubit( this._signInUseCase, this._signUpUseCase, this._signOutUseCase, this._checkTokenUseCase,this._getUserUseCase,this._saveUserUseCase) : super(SignInInitialState());

  Future<void> signIn(SignInParams signInParams) async {
    emit(SignInLoadingState());
    var response = await _signInUseCase(signInParams);
    if (response.$1 == null) {
      emit(SignInSuccessState());
    } else {
      emit(SignInErrorState(errorMessage: response.$1!.message));
    }
  }

  Future<void> signUp(SignUpParams signInParams) async {
    emit(SignUpLoadingState());

    var response = await _signUpUseCase(signInParams);
    if (response == null) {
      emit(SignUpSuccessState());
    } else {
      emit(SignUpErrorState(errorMessage: response.message));
    }
  }

  Future<void> signOut() async {
    await _signOutUseCase();
  }

  bool checkToken()  {
    bool isSigned = _checkTokenUseCase();
    if(isSigned){
      emit(SignInSuccessState());
    }
    return isSigned;
  }
  UserEntite getUser() => _getUserUseCase();
  void saveUser(UserEntite user) => _saveUserUseCase(user);
}

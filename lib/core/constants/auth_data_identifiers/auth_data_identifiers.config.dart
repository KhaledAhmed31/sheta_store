// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sheta_store/core/constants/auth_data_identifiers/register_mudel.dart'
    as _i1023;
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_local_data.dart'
    as _i223;
import 'package:sheta_store/features/auth/data/auth_local_data.dart/auth_cache_data.dart'
    as _i923;
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_data_base_data.dart'
    as _i713;
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_remote_data.dart'
    as _i812;
import 'package:sheta_store/features/auth/data/repository/auth_repo.dart'
    as _i118;
import 'package:sheta_store/features/auth/domain/repo/auth_repo_interface.dart'
    as _i968;
import 'package:sheta_store/features/auth/domain/use_cases/check_token_use_case.dart'
    as _i586;
import 'package:sheta_store/features/auth/domain/use_cases/sign_in_use_case.dart'
    as _i275;
import 'package:sheta_store/features/auth/domain/use_cases/sign_out_use_case.dart'
    as _i1038;
import 'package:sheta_store/features/auth/domain/use_cases/sign_up_use_case.dart'
    as _i422;
import 'package:sheta_store/features/auth/presentation/cubit/auth_cubit.dart'
    as _i611;
import 'package:sheta_store/features/categories/data/data_source/api/categories_api_data_source.dart'
    as _i187;
import 'package:sheta_store/features/categories/data/data_source/api/categories_remote_data_source.dart'
    as _i1059;
import 'package:sheta_store/features/categories/data/repository/categories_repo.dart';
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart'
    as _i16;
import 'package:sheta_store/features/categories/domain/use_cases/get_categories.dart'
    as _i645;
import 'package:sheta_store/features/categories/presentation/cubit/categories_cubit.dart'
    as _i897;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i897.CategoriesCubit>(
      () => _i897.CategoriesCubit(gh<_i645.GetCategoriesUseCase>()),
    );
    gh.singleton<_i223.AuthLocalData>(
      () => _i923.AuthCacheData(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i1059.CategoriesRemoteDataSource>(
      () => _i187.CategoriesApiDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i812.AuthRemoteData>(
      () => _i713.AuthDataBaseData(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i16.CategoriesRepoInterface>(
      () => CategoriesRepo(
        categoriesRemoteDataSource: gh<_i1059.CategoriesRemoteDataSource>(),
      ),
    );
    gh.singleton<_i968.AuthRepoInterface>(
      () => _i118.AuthRepo(
        authRemoteData: gh<_i812.AuthRemoteData>(),
        authLocalData: gh<_i223.AuthLocalData>(),
      ),
    );
    gh.singleton<_i645.GetCategoriesUseCase>(
      () => _i645.GetCategoriesUseCase(gh<_i16.CategoriesRepoInterface>()),
    );
    gh.singleton<_i275.SignInUseCase>(
      () =>
          _i275.SignInUseCase(authRepoInterface: gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i1038.SignOutUseCase>(
      () => _i1038.SignOutUseCase(
        authRepoInterface: gh<_i968.AuthRepoInterface>(),
      ),
    );
    gh.singleton<_i422.SignUpUseCase>(
      () =>
          _i422.SignUpUseCase(authRepoInterface: gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i586.CheckTokenUseCase>(
      () => _i586.CheckTokenUseCase(gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i611.AuthCubit>(
      () => _i611.AuthCubit(
        gh<_i275.SignInUseCase>(),
        gh<_i422.SignUpUseCase>(),
        gh<_i1038.SignOutUseCase>(),
        gh<_i586.CheckTokenUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i1023.RegisterModule {}

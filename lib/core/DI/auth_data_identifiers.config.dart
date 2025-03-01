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
import 'package:sheta_store/core/DI/register_mudel.dart' as _i91;
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_cache_data.dart'
    as _i242;
import 'package:sheta_store/features/auth/data/auth_local_data.dart/aurh_local_data.dart'
    as _i223;
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_data_base_data.dart'
    as _i713;
import 'package:sheta_store/features/auth/data/auth_remote_data_source/auth_remote_data.dart'
    as _i812;
import 'package:sheta_store/features/auth/data/repository/auth_repo.dart'
    as _i118;
import 'package:sheta_store/features/auth/presentation/cubit/sign_in_cubit.dart'
    as _i1026;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.singleton<_i223.AuthLocalData>(
        () => _i242.AuthCacheData(gh<_i460.SharedPreferences>()));
    gh.singleton<_i812.AuthRemoteData>(
        () => _i713.AuthDataBaseData(dio: gh<_i361.Dio>()));
    gh.singleton<_i118.AuthRepo>(() => _i118.AuthRepo(
          authRemoteData: gh<_i812.AuthRemoteData>(),
          authLocalData: gh<_i223.AuthLocalData>(),
        ));
    gh.singleton<_i1026.AuthCubit>(
        () => _i1026.AuthCubit(gh<_i118.AuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i91.RegisterModule {}

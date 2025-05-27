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
import 'package:sheta_store/core/dependency_injection/register_mudel.dart'
    as _i974;
import 'package:sheta_store/features/auth/data/auth_local_data.dart/auth_cache_data.dart';
import 'package:sheta_store/features/auth/data/auth_local_data.dart/auth_local_data.dart'
    as _i447;
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
import 'package:sheta_store/features/auth/domain/use_cases/get_user_use_case.dart'
    as _i227;
import 'package:sheta_store/features/auth/domain/use_cases/save_user_use_case.dart'
    as _i942;
import 'package:sheta_store/features/auth/domain/use_cases/sign_in_use_case.dart'
    as _i275;
import 'package:sheta_store/features/auth/domain/use_cases/sign_out_use_case.dart'
    as _i1038;
import 'package:sheta_store/features/auth/domain/use_cases/sign_up_use_case.dart'
    as _i422;
import 'package:sheta_store/features/auth/presentation/cubit/auth_cubit.dart'
    as _i611;
import 'package:sheta_store/features/cart/data/datasources/cart_data_source.dart'
    as _i965;
import 'package:sheta_store/features/cart/data/datasources/cart_remote_data_source.dart'
    as _i917;
import 'package:sheta_store/features/cart/data/repositories/cart_repo.dart'
    as _i557;
import 'package:sheta_store/features/cart/domain/repositories/cart_repo_interface.dart'
    as _i513;
import 'package:sheta_store/features/cart/domain/usecases/add_to_cart_use_case.dart'
    as _i181;
import 'package:sheta_store/features/cart/domain/usecases/delete_cart_product_use_case.dart'
    as _i309;
import 'package:sheta_store/features/cart/domain/usecases/get_cart_use_case.dart'
    as _i886;
import 'package:sheta_store/features/cart/domain/usecases/update_cart_product_quantatiy_use_case.dart'
    as _i521;
import 'package:sheta_store/features/cart/presentation/cubit/cart_cubit.dart'
    as _i1013;
import 'package:sheta_store/features/categories/data/data_source/api/categories_api_data_source.dart'
    as _i187;
import 'package:sheta_store/features/categories/data/data_source/api/categories_remote_data_source.dart'
    as _i1059;
import 'package:sheta_store/features/categories/data/repository/categories_repo.dart'
    as _i533;
import 'package:sheta_store/features/categories/domain/repo/categories_repo_interface.dart'
    as _i16;
import 'package:sheta_store/features/categories/domain/use_cases/get_categories.dart'
    as _i645;
import 'package:sheta_store/features/categories/presentation/cubit/categories_cubit.dart'
    as _i897;
import 'package:sheta_store/features/product/data/data%20sources/products_data_source.dart'
    as _i525;
import 'package:sheta_store/features/product/data/data%20sources/products_remote_data_source.dart'
    as _i320;
import 'package:sheta_store/features/product/data/repositories/product_repo.dart'
    as _i629;
import 'package:sheta_store/features/product/domain/repositories/product_repo_interface.dart'
    as _i78;
import 'package:sheta_store/features/product/domain/usecases/get_product_details.dart'
    as _i225;
import 'package:sheta_store/features/product/domain/usecases/get_products_list.dart'
    as _i992;
import 'package:sheta_store/features/product/presentation/cubit/product_cubit.dart'
    as _i1015;

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
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i447.AuthLocalData>(
      () => AuthCacheData(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i965.CartDataSource>(
      () => _i917.CartRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1059.CategoriesRemoteDataSource>(
      () => _i187.CategoriesApiDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i525.ProductsDataSource>(
      () => _i320.ProductsRemoteDataSource(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i78.ProductRepoInterface>(
      () =>
          _i629.ProductRepo(productDataSource: gh<_i525.ProductsDataSource>()),
    );
    gh.singleton<_i812.AuthRemoteData>(
      () => _i713.AuthDataBaseData(dio: gh<_i361.Dio>()),
    );
    gh.singleton<_i992.GetProductsList>(
      () => _i992.GetProductsList(gh<_i78.ProductRepoInterface>()),
    );
    gh.singleton<_i225.GetProductDetails>(
      () => _i225.GetProductDetails(gh<_i78.ProductRepoInterface>()),
    );
    gh.lazySingleton<_i16.CategoriesRepoInterface>(
      () => _i533.CategoriesRepo(
        categoriesRemoteDataSource: gh<_i1059.CategoriesRemoteDataSource>(),
      ),
    );
    gh.singleton<_i513.CartRepoInterface>(
      () => _i557.CartRepo(cartDataSource: gh<_i965.CartDataSource>()),
    );
    gh.singleton<_i181.AddToCartUseCase>(
      () => _i181.AddToCartUseCase(gh<_i513.CartRepoInterface>()),
    );
    gh.singleton<_i309.DeleteCartProductUseCase>(
      () => _i309.DeleteCartProductUseCase(gh<_i513.CartRepoInterface>()),
    );
    gh.singleton<_i521.UpdateCartProductQuantatiyUseCase>(
      () => _i521.UpdateCartProductQuantatiyUseCase(
        gh<_i513.CartRepoInterface>(),
      ),
    );
    gh.singleton<_i886.GetCartUseCase>(
      () => _i886.GetCartUseCase(gh<_i513.CartRepoInterface>()),
    );
    gh.factory<_i1015.ProductCubit>(
      () => _i1015.ProductCubit(
        gh<_i225.GetProductDetails>(),
        gh<_i992.GetProductsList>(),
      ),
    );
    gh.singleton<_i968.AuthRepoInterface>(
      () => _i118.AuthRepo(
        authRemoteData: gh<_i812.AuthRemoteData>(),
        authLocalData: gh<_i447.AuthLocalData>(),
      ),
    );
    gh.singleton<_i645.GetCategoriesUseCase>(
      () => _i645.GetCategoriesUseCase(gh<_i16.CategoriesRepoInterface>()),
    );
    gh.singleton<_i1013.CartCubit>(
      () => _i1013.CartCubit(
        gh<_i181.AddToCartUseCase>(),
        gh<_i886.GetCartUseCase>(),
        gh<_i309.DeleteCartProductUseCase>(),
        gh<_i521.UpdateCartProductQuantatiyUseCase>(),
      ),
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
    gh.lazySingleton<_i897.CategoriesCubit>(
      () => _i897.CategoriesCubit(gh<_i645.GetCategoriesUseCase>()),
    );
    gh.singleton<_i586.CheckTokenUseCase>(
      () => _i586.CheckTokenUseCase(gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i227.GetUserUseCase>(
      () => _i227.GetUserUseCase(gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i942.SaveUserUseCase>(
      () => _i942.SaveUserUseCase(gh<_i968.AuthRepoInterface>()),
    );
    gh.singleton<_i611.AuthCubit>(
      () => _i611.AuthCubit(
        gh<_i275.SignInUseCase>(),
        gh<_i422.SignUpUseCase>(),
        gh<_i1038.SignOutUseCase>(),
        gh<_i586.CheckTokenUseCase>(),
        gh<_i227.GetUserUseCase>(),
        gh<_i942.SaveUserUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i974.RegisterModule {}

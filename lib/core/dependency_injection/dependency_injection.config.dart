// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:grind_lab/core/router/app_router.dart' as _i100;
import 'package:grind_lab/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i567;
import 'package:grind_lab/features/auth/data/repositories/auth_repository_impl.dart'
    as _i83;
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart'
    as _i301;
import 'package:grind_lab/features/main/cubit/main_cubit.dart' as _i693;
import 'package:grind_lab/features/splash/presentation/cubit/splash_cubit.dart'
    as _i773;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i693.MainCubit>(() => _i693.MainCubit());
    gh.factory<_i773.SplashCubit>(() => _i773.SplashCubit());
    gh.lazySingleton<_i100.AppRouter>(() => _i100.AppRouter());
    gh.factory<_i567.AuthRemoteDataSource>(
      () => _i567.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i301.AuthRepository>(
      () => _i83.AuthRepositoryImpl(gh<_i567.AuthRemoteDataSource>()),
    );
    return this;
  }
}

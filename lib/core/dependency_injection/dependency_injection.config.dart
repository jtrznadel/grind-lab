// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:grind_lab/core/dependency_injection/modules/supabase_module.dart'
    as _i696;
import 'package:grind_lab/core/router/app_router.dart' as _i100;
import 'package:grind_lab/core/services/video_preloader_service.dart' as _i207;
import 'package:grind_lab/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i567;
import 'package:grind_lab/features/auth/data/repositories/auth_repository_impl.dart'
    as _i83;
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart'
    as _i301;
import 'package:grind_lab/features/auth/domain/usecases/observe_auth_state.dart'
    as _i1010;
import 'package:grind_lab/features/auth/domain/usecases/sign_in.dart' as _i582;
import 'package:grind_lab/features/auth/domain/usecases/sign_out.dart' as _i952;
import 'package:grind_lab/features/auth/domain/usecases/sign_up.dart' as _i23;
import 'package:grind_lab/features/auth/presentation/cubit/auth_session_cubit.dart'
    as _i509;
import 'package:grind_lab/features/main/cubit/main_cubit.dart' as _i693;
import 'package:grind_lab/features/profile/presentation/cubit/profile_cubit.dart'
    as _i566;
import 'package:grind_lab/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i144;
import 'package:grind_lab/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i386;
import 'package:grind_lab/features/splash/presentation/cubit/splash_cubit.dart'
    as _i773;
import 'package:grind_lab/features/welcome/presentation/cubit/welcome_cubit.dart'
    as _i878;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i693.MainCubit>(() => _i693.MainCubit());
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.lazySingleton<_i100.AppRouter>(() => _i100.AppRouter());
    gh.lazySingleton<_i207.VideoPreloaderService>(
      () => _i207.VideoPreloaderService(),
    );
    gh.lazySingleton<_i567.AuthRemoteDataSource>(
      () => _i567.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i773.SplashCubit>(
      () => _i773.SplashCubit(gh<_i207.VideoPreloaderService>()),
    );
    gh.factory<_i878.WelcomeCubit>(
      () => _i878.WelcomeCubit(gh<_i207.VideoPreloaderService>()),
    );
    gh.factory<_i301.AuthRepository>(
      () => _i83.AuthRepositoryImpl(gh<_i567.AuthRemoteDataSource>()),
    );
    gh.factory<_i1010.ObserveAuthState>(
      () => _i1010.ObserveAuthState(gh<_i301.AuthRepository>()),
    );
    gh.factory<_i582.SignIn>(() => _i582.SignIn(gh<_i301.AuthRepository>()));
    gh.factory<_i952.SignOut>(() => _i952.SignOut(gh<_i301.AuthRepository>()));
    gh.factory<_i23.SignUp>(() => _i23.SignUp(gh<_i301.AuthRepository>()));
    gh.factory<_i386.SignUpCubit>(
      () => _i386.SignUpCubit(
        gh<_i23.SignUp>(),
        gh<_i207.VideoPreloaderService>(),
      ),
    );
    gh.factory<_i144.SignInCubit>(
      () => _i144.SignInCubit(
        gh<_i582.SignIn>(),
        gh<_i207.VideoPreloaderService>(),
      ),
    );
    gh.lazySingleton<_i509.AuthSessionCubit>(
      () => _i509.AuthSessionCubit(gh<_i1010.ObserveAuthState>()),
    );
    gh.factory<_i566.ProfileCubit>(
      () => _i566.ProfileCubit(gh<_i952.SignOut>()),
    );
    return this;
  }
}

class _$SupabaseModule extends _i696.SupabaseModule {}

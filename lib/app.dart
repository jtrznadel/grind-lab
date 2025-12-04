import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/router/app_router.dart';
import 'package:grind_lab/core/theme/app_theme.dart';
import 'package:grind_lab/features/auth/presentation/auth_session_cubit/auth_session_cubit.dart';
import 'package:grind_lab/features/main/presentation/main_screen.dart';
import 'package:grind_lab/features/splash/presentation/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = inject<AppRouter>();
    final routerConfig = router.config();
    return BlocProvider(
      create: (_) => inject<AuthSessionCubit>(),
      child: BlocListener<AuthSessionCubit, AuthSessionState>(
        listener: (context, state) {
          final currentPath =
              routerConfig.routerDelegate.currentConfiguration.fullPath;
          if (currentPath == SplashScreen.path) return;
          state.mapOrNull(
            authenticated: (_) {
              if (router.publicPaths.contains(currentPath)) {
                routerConfig.goNamed(MainScreen.name);
              }
            },
            unauthenticated: (_) {
              if (!router.publicPaths.contains(currentPath)) {
                routerConfig.goNamed(SplashScreen.name);
              }
            },
          );
        },
        child: MaterialApp.router(
          title: 'grind.lab',
          theme: AppTheme.theme,
          routerConfig: routerConfig,
        ),
      ),
    );
  }
}

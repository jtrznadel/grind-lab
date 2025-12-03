import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/router/app_router.dart';
import 'package:grind_lab/core/theme/app_theme.dart';
import 'package:grind_lab/features/auth/presentation/auth_session_cubit/auth_session_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<AuthSessionCubit>(),
      child: MaterialApp.router(
        title: 'grind.lab',
        theme: AppTheme.theme,
        routerConfig: inject<AppRouter>().config(),
      ),
    );
  }
}

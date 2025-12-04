import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/auth/presentation/auth_session_cubit/auth_session_cubit.dart';
import 'package:grind_lab/features/main/presentation/main_screen.dart';
import 'package:grind_lab/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';
import 'package:hugeicons/hugeicons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String name = 'splash';
  static const String path = '/splash';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: BlocProvider(
        create: (context) => inject<SplashCubit>()..init(),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            _tryNavigate(context);
          },
        ),
        BlocListener<AuthSessionCubit, AuthSessionState>(
          listener: (context, state) {
            _tryNavigate(context);
          },
        ),
      ],
      child: AppScaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedBackMuscleBody,
              size: 60.0,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  void _tryNavigate(BuildContext context) {
    final splashState = context.read<SplashCubit>().state;
    final authState = context.read<AuthSessionCubit>().state;

    final isReady = splashState.maybeMap(
      loaded: (_) => true,
      orElse: () => false,
    );

    if (!isReady) {
      return;
    }

    authState.mapOrNull(
      authenticated: (_) {
        context.goNamed(MainScreen.name);
      },
      unauthenticated: (_) {
        context.goNamed(WelcomeScreen.name);
      },
    );
  }
}

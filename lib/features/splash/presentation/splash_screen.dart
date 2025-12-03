import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          state.mapOrNull(
            toWelcome: (_) => context.goNamed(WelcomeScreen.name),
            toHome: (_) => context.goNamed(MainScreen.name),
          );
        },
        builder: (context, state) {
          return Center(
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedBackMuscleBody,
              size: 60.0,
              color: AppColors.primary,
            ),
          );
        },
      ),
    );
  }
}

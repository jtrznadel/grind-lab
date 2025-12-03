import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:grind_lab/features/welcome/presentation/view/widgets/welcome_actions.dart';
import 'package:grind_lab/features/welcome/presentation/view/widgets/welcome_logo.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const String name = 'welcome';
  static const String path = '/welcome';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isSafeAreaBottom: false,
      isSafeAreaTop: false,
      overlayStyle: SystemUiOverlayStyle.light,
      body: BlocProvider(
        create: (context) => inject<WelcomeCubit>(),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeCubit, WelcomeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: state.maybeWhen(
                ready: (controller) => _VideoBackground(controller: controller),
                orElse: () => SizedBox.shrink(),
              ),
            ),
            Positioned(left: 0, bottom: 0, right: 0, child: _WelcomeGradient()),
            Center(child: WelcomeLogo()),
            Positioned(
              left: 16,
              right: 16,
              bottom: 64,
              child: WelcomeActions(),
            ),
          ],
        );
      },
    );
  }
}

class _WelcomeGradient extends StatelessWidget {
  const _WelcomeGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

class _VideoBackground extends StatelessWidget {
  const _VideoBackground({required this.controller});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: controller.value.size.width,
        height: controller.value.size.height,
        child: VideoPlayer(controller),
      ),
    );
  }
}

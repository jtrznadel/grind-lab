import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/welcome/presentation/cubit/welcome_cubit.dart';
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
      body: BlocProvider(
        create: (context) => inject<WelcomeCubit>(),
        child: _Body(),
      ),
    );
  }
}

class SubjectBloc {}

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
                ready: (controller) => FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
                orElse: () => SizedBox.shrink(),
              ),
            ),
            Center(
              child: Text(
                'Welcome to grind.lab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

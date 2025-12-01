import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/presentation/app_back_button.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = 'sign_up';
  static const String path = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return AppBackButton(onTap: () => context.goNamed(WelcomeScreen.name));
  }
}

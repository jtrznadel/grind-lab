import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';
import 'package:grind_lab/features/sign_in/presentation/view/sign_in_screen.dart';
import 'package:grind_lab/features/sign_up/presentation/view/sign_up_screen.dart';

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          onPressed: () {
            context.pushNamed(SignUpScreen.name);
          },

          backgroundColor: Colors.transparent,
          shadowEnabled: false,
          borderColor: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Text(
            'Create Account',
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(height: 16),
        AppElevatedButton(
          onPressed: () {
            context.pushNamed(SignInScreen.name);
          },
          backgroundColor: Colors.transparent,
          borderColor: Colors.transparent,
          shadowEnabled: false,

          child: Text(
            'Sign In',
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

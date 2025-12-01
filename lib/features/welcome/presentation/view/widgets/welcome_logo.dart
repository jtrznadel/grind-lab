import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'grind',
        style: context.textTheme.displayLarge?.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: '.lab',
            style: context.textTheme.displayLarge?.copyWith(
              color: AppColors.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';

class HomeTextHeader extends StatelessWidget {
  const HomeTextHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Today is ',
        style: context.textTheme.labelMedium?.copyWith(
          color: AppColors.textDarkGray,
        ),
        children: [
          TextSpan(
            text: 'PUSH',
            style: context.textTheme.headlineMedium?.copyWith(
              color: AppColors.accentColor,
            ),
          ),
          TextSpan(
            text: ' day',
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColors.textDarkGray,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_shadows.dart';
import 'package:hugeicons/hugeicons.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            context.canPop() ? context.pop() : null;
          },

      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          shape: BoxShape.circle,
          boxShadow: AppShadows.buttonShadow,
        ),
        child: Center(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            size: 24,
            color: AppColors.iconPrimary,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_shadows.dart';
import 'package:grind_lab/core/constants/app_values.dart';

class AppTile extends StatelessWidget {
  const AppTile({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultHorizontalPadding,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppShadows.primaryShadow,
        ),
        child: child,
      ),
    );
  }
}

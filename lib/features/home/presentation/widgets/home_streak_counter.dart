import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeStreakCounter extends StatelessWidget {
  const HomeStreakCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        children: [
          HugeIcon(
            icon: HugeIcons.strokeRoundedFire03,
            color: AppColors.primary,
            size: 16,
          ),
          SizedBox(width: 2),
          Text('5', style: context.textTheme.labelSmall),
        ],
      ),
    );
  }
}

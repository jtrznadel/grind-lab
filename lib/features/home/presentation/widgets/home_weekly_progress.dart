import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';
import 'package:grind_lab/core/presentation/app_tile.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeWeeklyProgress extends StatelessWidget {
  const HomeWeeklyProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('November 15-22', style: context.textTheme.labelMedium),
          RichText(
            text: TextSpan(
              text: '4 of 6',
              style: context.textTheme.labelSmall?.copyWith(
                color: AppColors.accentColor,
              ),
              children: [
                TextSpan(
                  text: ' trainings completed',
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                height: 6,
                width: (MediaQuery.of(context).size.width - 72) * (4 / 6),
                decoration: BoxDecoration(
                  color: AppColors.accentColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Divider(),
          SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Todays ',
                    style: context.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'PUSH ',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'workout has not been completed yet.',
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              AppElevatedButton(
                onPressed: () {},
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedPlay,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

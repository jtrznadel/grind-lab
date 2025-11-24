import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_shadows.dart';
import 'package:grind_lab/core/constants/app_values.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/extensions/date_time_extensions.dart';

class HomeDayTimeline extends StatelessWidget {
  const HomeDayTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultHorizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          final day = DateTime.now().subtract(Duration(days: 6 - index));
          return _TimelineItem(day: day);
        }),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.day});

  final DateTime day;

  @override
  Widget build(BuildContext context) {
    final bool isToday = day.isSameDate(DateTime.now());
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 45),
      child: Container(
        decoration: BoxDecoration(
          color: isToday ? AppColors.accentColor : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppShadows.primaryShadow,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: [
            Text(
              day.toShortDayName(),
              style: context.textTheme.labelSmall?.copyWith(
                color: isToday ? AppColors.white : AppColors.textDarkGray,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              day.day.toString(),
              style: context.textTheme.labelMedium?.copyWith(
                color: isToday ? AppColors.white : AppColors.textDarkGray,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

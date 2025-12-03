import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_values.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/core/presentation/app_tile.dart';
import 'package:grind_lab/core/resources/media_res.dart';
import 'package:grind_lab/features/home/presentation/widgets/home_day_timeline.dart';
import 'package:grind_lab/features/home/presentation/widgets/home_streak_counter.dart';
import 'package:grind_lab/features/home/presentation/widgets/home_text_header.dart';
import 'package:grind_lab/features/home/presentation/widgets/home_weekly_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home';
  static const String path = '/home';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Header(),
        SizedBox(height: 16),
        HomeDayTimeline(),
        SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeWeeklyProgress(),
                SizedBox(height: 24),
                AppTile(child: Image.asset(MediaRes.bodyDefault)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultHorizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [HomeTextHeader(), HomeStreakCounter()],
      ),
    );
  }
}

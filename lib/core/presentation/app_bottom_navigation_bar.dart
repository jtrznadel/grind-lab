import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_values.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/features/main/cubit/main_cubit.dart';
import 'package:hugeicons/hugeicons.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (value) {
            final int currentIndex = value.currentIndex;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: AppValues.appBarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: .2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Item(
                      isActive: currentIndex == 0,
                      icon: HugeIcons.strokeRoundedHome12,
                      label: 'Home',
                      onTap: () => context.read<MainCubit>().changePage(0),
                    ),
                    _Item(
                      isActive: currentIndex == 1,
                      icon: HugeIcons.strokeRoundedBodyPartMuscle,
                      label: 'Plan',
                      onTap: () => context.read<MainCubit>().changePage(1),
                    ),
                    _Item(
                      isActive: currentIndex == 2,
                      icon: HugeIcons.strokeRoundedTapeMeasure,
                      label: 'Measure',
                      onTap: () => context.read<MainCubit>().changePage(2),
                    ),
                    _Item(
                      isActive: currentIndex == 3,
                      icon: HugeIcons.strokeRoundedUser,
                      label: 'Profile',
                      onTap: () => context.read<MainCubit>().changePage(3),
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.isActive,
    required this.icon,
    required this.onTap,
    required this.label,
  });
  final bool isActive;
  final List<List<dynamic>> icon;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = isActive
        ? AppColors.iconPrimary
        : AppColors.iconSecondary;

    final Color textColor = isActive
        ? AppColors.textPrimary
        : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HugeIcon(icon: icon, color: iconColor, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: context.textTheme.labelSmall?.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}

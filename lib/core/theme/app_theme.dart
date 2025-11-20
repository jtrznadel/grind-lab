import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/theme/app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.labelLarge,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textTheme,
    iconTheme: const IconThemeData(color: AppColors.primary),
  );
}

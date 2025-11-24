import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';

class AppShadows {
  AppShadows._();

  static final primaryShadow = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: .1),
      blurRadius: 10,
      offset: Offset(0, 2),
    ),
  ];

  static final navShadow = [
    BoxShadow(
      color: AppColors.black.withValues(alpha: .2),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}

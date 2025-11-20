import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.isSafeAreaTop = true,
    this.isSafeAreaBottom = true,
  });
  final Widget body;
  final bool isSafeAreaTop;
  final Color? backgroundColor;
  final bool isSafeAreaBottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      body: SafeArea(top: isSafeAreaTop, bottom: isSafeAreaBottom, child: body),
    );
  }
}

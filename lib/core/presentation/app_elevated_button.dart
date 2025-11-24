import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.padding,
    this.isDisabled = false,
    this.height,
    this.backgroundColor,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final EdgeInsets? padding;
  final bool isDisabled;
  final double? height;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.accentColor,
          shadowColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          disabledBackgroundColor:
              backgroundColor?.withValues(alpha: 0.4) ?? AppColors.lightGray,
        ),
        child: DefaultTextStyle(
          style: context.textTheme.labelMedium!,
          child: child,
        ),
      ),
    );
  }
}

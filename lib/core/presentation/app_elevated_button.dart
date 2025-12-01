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
    this.borderColor,
    this.overlayColor,
    this.shadowEnabled = true,
  });
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final EdgeInsets? padding;
  final bool isDisabled;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? overlayColor;
  final bool shadowEnabled;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          overlayColor: overlayColor ?? AppColors.primary,
          shadowColor: shadowEnabled == true
              ? AppColors.black
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          disabledBackgroundColor:
              backgroundColor?.withValues(alpha: 0.4) ?? AppColors.lightGray,
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        child: DefaultTextStyle(
          style:
              context.textTheme.labelMedium?.copyWith(
                color: isDisabled
                    ? AppColors.white.withValues(alpha: 0.7)
                    : AppColors.white,
                fontWeight: FontWeight.w600,
              ) ??
              const TextStyle(),
          child: child,
        ),
      ),
    );
  }
}

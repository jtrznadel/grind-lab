import 'package:flutter/material.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.keyboardType,
    required this.obscureText,
  });

  final String hint;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: AppColors.backgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        hintText: hint,
      ),
      style: context.textTheme.bodyMedium,
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';

class SignUpOtherOptionsSection extends StatelessWidget {
  const SignUpOtherOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppElevatedButton(
          onPressed: () {},
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderColor,
          shadowEnabled: false,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.apple, color: AppColors.iconPrimary),
              SizedBox(width: 8),
              Text(
                'Continue with Apple',
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        AppElevatedButton(
          onPressed: () {},
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderColor,
          shadowEnabled: false,
          width: double.infinity,

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.google, color: AppColors.iconPrimary),
              SizedBox(width: 8),
              Text(
                'Continue with Google',
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        AppElevatedButton(
          onPressed: () {},
          backgroundColor: AppColors.white,
          borderColor: AppColors.borderColor,
          shadowEnabled: false,
          width: double.infinity,

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.facebook, color: AppColors.iconPrimary),
              SizedBox(width: 8),
              Text(
                'Continue with Facebook',
                style: context.textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

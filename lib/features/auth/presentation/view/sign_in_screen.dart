import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_values.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_back_button.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/core/presentation/app_text_field.dart';
import 'package:grind_lab/features/auth/presentation/view/sign_up_screen.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String name = 'sign_in';
  static const String path = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBackButton(onTap: () => context.goNamed(WelcomeScreen.name)),
          SizedBox(height: 36),
          Text('Welcome Back', style: context.textTheme.headlineMedium),
          SizedBox(height: 32),
          AppTextField(
            hint: 'Enter your email',
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(height: 8),
          AppTextField(
            hint: 'Enter your password',
            onChanged: (value) {},
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Forgot Password?',
                style: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.accentColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          AppElevatedButton(onPressed: () {}, child: Text("Sign In")),
          SizedBox(height: 24),
          Center(
            child: Text(
              'or',
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          SizedBox(height: 24),
          AppElevatedButton(
            onPressed: () {},
            backgroundColor: AppColors.white,
            borderColor: AppColors.borderColor,
            shadowEnabled: false,

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
          Spacer(),
          Center(
            child: InkWell(
              onTap: () {
                context.goNamed(SignUpScreen.name);
              },
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/constants/app_colors.dart';
import 'package:grind_lab/core/constants/app_values.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/extensions/context_extensions.dart';
import 'package:grind_lab/core/presentation/app_back_button.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/core/presentation/app_text_field.dart';
import 'package:grind_lab/features/sign_in/presentation/cubit/sign_in_cubit.dart';
import 'package:grind_lab/features/sign_up/presentation/view/sign_up_screen.dart';
import 'package:grind_lab/features/sign_in/presentation/view/widgets/sign_in_other_options_section.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String name = 'sign_in';
  static const String path = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<SignInCubit>(),
      child: const _SignInView(),
    );
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        state.mapOrNull(
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },
      child: AppScaffold(body: const _Body()),
    );
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
          _Form(),
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
          SignInOtherOptionsSection(),
          Spacer(),
          _Footer(),
        ],
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hint: 'Enter your email',
          onChanged: (value) {
            context.read<SignInCubit>().updateEmail(email: value);
          },
          keyboardType: TextInputType.emailAddress,
          obscureText: false,
        ),
        SizedBox(height: 8),
        AppTextField(
          hint: 'Enter your password',
          onChanged: (value) {
            context.read<SignInCubit>().updatePassword(password: value);
          },
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
        AppElevatedButton(
          onPressed: () {
            context.read<SignInCubit>().signIn();
          },
          width: double.infinity,
          child: Text("Sign In"),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

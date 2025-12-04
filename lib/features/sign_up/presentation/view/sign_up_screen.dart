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
import 'package:grind_lab/features/sign_in/presentation/view/sign_in_screen.dart';
import 'package:grind_lab/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:grind_lab/features/sign_up/presentation/view/widgets/sign_up_other_options_section.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = 'sign_up';
  static const String path = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<SignUpCubit>(),
      child: const _SignUpView(),
    );
  }
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
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
      child: AppScaffold(body: _Body()),
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
          Text('Create Your Account', style: context.textTheme.headlineMedium),
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
          SignUpOtherOptionsSection(),
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
            context.read<SignUpCubit>().updateEmail(email: value);
          },
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 8),
        AppTextField(
          hint: 'Enter your name',
          onChanged: (value) {
            context.read<SignUpCubit>().updateName(name: value);
          },
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 8),
        AppTextField(
          hint: 'Enter your password',
          onChanged: (value) {
            context.read<SignUpCubit>().updatePassword(password: value);
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),

        SizedBox(height: 32),
        AppElevatedButton(
          onPressed: () {
            context.read<SignUpCubit>().signUp();
          },
          width: double.infinity,
          child: Text("Sign Up"),
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
          context.goNamed(SignInScreen.name);
        },
        child: RichText(
          text: TextSpan(
            text: "Do you have an account? ",
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
            children: [
              TextSpan(
                text: 'Sign In',
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

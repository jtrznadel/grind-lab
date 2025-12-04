import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/presentation/app_elevated_button.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/profile/presentation/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String name = 'profile';
  static const String path = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<ProfileCubit>(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Profile Screen"),
        SizedBox(height: 20),
        AppElevatedButton(
          onPressed: () {
            context.read<ProfileCubit>().signOut();
          },
          child: Text("Sign Out"),
        ),
      ],
    );
  }
}

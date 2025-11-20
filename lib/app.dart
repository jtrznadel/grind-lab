import 'package:flutter/material.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/router/app_router.dart';
import 'package:grind_lab/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'grind.lab',
      theme: AppTheme.theme,
      routerConfig: inject<AppRouter>().config(),
    );
  }
}

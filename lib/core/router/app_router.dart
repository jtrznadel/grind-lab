import 'package:go_router/go_router.dart';
import 'package:grind_lab/core/router/app_page_transitions.dart';
import 'package:grind_lab/features/auth/presentation/view/sign_in_screen.dart';
import 'package:grind_lab/features/auth/presentation/view/sign_up_screen.dart';
import 'package:grind_lab/features/main/presentation/main_screen.dart';
import 'package:grind_lab/features/splash/presentation/splash_screen.dart';
import 'package:grind_lab/features/welcome/presentation/view/welcome_screen.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppRouter {
  AppRouter();

  final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        pageBuilder: (context, state) =>
            AppPageTransitions.fadeTransition(child: const SplashScreen()),
      ),
      GoRoute(
        path: WelcomeScreen.path,
        name: WelcomeScreen.name,
        pageBuilder: (context, state) =>
            AppPageTransitions.fadeTransition(child: const WelcomeScreen()),
      ),
      GoRoute(
        path: SignUpScreen.path,
        name: SignUpScreen.name,
        pageBuilder: (context, state) =>
            AppPageTransitions.fadeTransition(child: const SignUpScreen()),
      ),
      GoRoute(
        path: SignInScreen.path,
        name: SignInScreen.name,
        pageBuilder: (context, state) =>
            AppPageTransitions.fadeTransition(child: const SignInScreen()),
      ),
      GoRoute(
        path: MainScreen.path,
        name: MainScreen.name,
        pageBuilder: (context, state) =>
            AppPageTransitions.fadeTransition(child: const MainScreen()),
      ),
    ],
  );

  GoRouter config() => _router;
}

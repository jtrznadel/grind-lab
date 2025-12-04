import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grind_lab/core/dependency_injection/dependency_injection.dart';
import 'package:grind_lab/core/presentation/app_bottom_navigation_bar.dart';
import 'package:grind_lab/core/presentation/app_scaffold.dart';
import 'package:grind_lab/features/home/presentation/home_screen.dart';
import 'package:grind_lab/features/main/cubit/main_cubit.dart';
import 'package:grind_lab/features/profile/presentation/view/profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String name = 'main';
  static const String path = '/main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject<MainCubit>(),
      child: AppScaffold(
        isSafeAreaTop: false,
        isSafeAreaBottom: false,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        state.when(
          loaded: (currentIndex) {
            if (_pageController.hasClients) {
              _pageController.animateToPage(
                currentIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        );
      },
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return HomeScreen();
                case 1:
                  return Text('Training Plan Screen');
                case 2:
                  return Text('Measurments Screen');
                case 3:
                  return ProfileScreen();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: const AppBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/core/services/video_preloader_service.dart';
import 'package:grind_lab/features/auth/domain/entities/user_entity.dart';
import 'package:grind_lab/features/auth/domain/usecases/observe_auth_state.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._observeAuthState, this._videoPreloaderService)
    : super(const SplashState.loading());

  final VideoPreloaderService _videoPreloaderService;
  final ObserveAuthState _observeAuthState;
  StreamSubscription<UserEntity?>? _authSubscription;

  Future<void> init() async {
    _authSubscription = _observeAuthState().listen((user) async {
      await _authSubscription?.cancel();
      if (user != null) {
        emit(const SplashState.toHome());
      } else {
        await _videoPreloaderService.initializeWelcomeVideo();
        emit(const SplashState.toWelcome());
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}

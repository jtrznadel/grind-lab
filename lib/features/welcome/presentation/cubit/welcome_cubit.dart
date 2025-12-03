import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/core/services/video_preloader_service.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

part 'welcome_state.dart';
part 'welcome_cubit.freezed.dart';

@injectable
class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit(this._videoPreloaderService) : super(WelcomeState.initial()) {
    _init();
  }

  final VideoPreloaderService _videoPreloaderService;

  void _init() {
    final controller = _videoPreloaderService.controller;
    if (controller != null && controller.value.isInitialized) {
      controller.play();
      emit(WelcomeState.ready(controller));
    }
  }

  @override
  Future<void> close() {
    _videoPreloaderService.dispose();
    return super.close();
  }
}

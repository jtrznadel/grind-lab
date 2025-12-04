import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/core/services/video_preloader_service.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._videoPreloaderService) : super(SplashState.loading());

  final VideoPreloaderService _videoPreloaderService;

  Future<void> init() async {
    await _videoPreloaderService.initializeWelcomeVideo();
    emit(SplashState.loaded());
  }
}

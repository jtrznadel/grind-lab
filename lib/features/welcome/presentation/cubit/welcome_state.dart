part of 'welcome_cubit.dart';

@freezed
class WelcomeState with _$WelcomeState {
  const factory WelcomeState.initial() = _Initial;
  const factory WelcomeState.ready(VideoPlayerController controller) = _Ready;
}

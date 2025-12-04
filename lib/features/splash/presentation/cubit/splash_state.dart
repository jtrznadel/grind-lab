part of 'splash_cubit.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.loading() = _Loading;
  const factory SplashState.loaded() = _Loaded;
}

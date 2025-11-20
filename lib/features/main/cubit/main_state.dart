part of 'main_cubit.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState.loaded({required int currentIndex}) = _Loaded;
}

part of 'sign_up_cubit.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState.initial({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
  }) = _Initial;
  const factory SignUpState.loading({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
  }) = _Loading;
  const factory SignUpState.success({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
  }) = _Success;
  const factory SignUpState.error({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
    required String message,
  }) = _Error;
}

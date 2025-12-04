part of 'sign_in_cubit.dart';

@freezed
abstract class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState.initial({
    @Default('') String email,
    @Default('') String password,
  }) = _Initial;

  const factory SignInState.loading({
    @Default('') String email,
    @Default('') String password,
  }) = _Loading;

  const factory SignInState.success({
    @Default('') String email,
    @Default('') String password,
  }) = _Success;

  const factory SignInState.error({
    @Default('') String email,
    @Default('') String password,
    required String message,
  }) = _Error;
}

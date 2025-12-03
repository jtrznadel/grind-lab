part of 'auth_session_cubit.dart';

@freezed
class AuthSessionState with _$AuthSessionState {
  const factory AuthSessionState.initial() = _Initial;
  const factory AuthSessionState.authenticated() = _Authenticated;
  const factory AuthSessionState.unauthenticated() = _Unauthenticated;
}

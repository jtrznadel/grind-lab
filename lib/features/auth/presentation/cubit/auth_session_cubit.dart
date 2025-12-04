import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/features/auth/domain/entities/user_entity.dart';
import 'package:grind_lab/features/auth/domain/usecases/observe_auth_state.dart';
import 'package:injectable/injectable.dart';

part 'auth_session_state.dart';
part 'auth_session_cubit.freezed.dart';

@lazySingleton
class AuthSessionCubit extends Cubit<AuthSessionState> {
  AuthSessionCubit(this._observeAuthState)
    : super(const AuthSessionState.initial()) {
    _subscription = _observeAuthState().listen(
      (user) {
        if (user != null) {
          emit(const AuthSessionState.authenticated());
        } else {
          emit(const AuthSessionState.unauthenticated());
        }
      },
      onError: (error) {
        emit(const AuthSessionState.unauthenticated());
      },
    );
  }

  final ObserveAuthState _observeAuthState;
  late final StreamSubscription<UserEntity?> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

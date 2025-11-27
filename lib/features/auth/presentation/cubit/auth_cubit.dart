import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/features/auth/domain/entities/auth_entity.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState.initial()) {
    _initAuthStream();
  }

  final AuthRepository _authRepository;
  StreamSubscription<AuthEntity>? _authSubscription;

  void _initAuthStream() {
    if (_authRepository.isAuthenticated) {
      emit(AuthState.authenticated());
    } else {
      emit(AuthState.unauthenticated());
    }
    _authSubscription = _authRepository.authStateStream.listen(
      (authEntity) {
        authEntity.when(
          authenticated: () => emit(AuthState.authenticated()),
          unauthenticated: () => emit(AuthState.unauthenticated()),
        );
      },
      onError: (error) {
        emit(AuthState.error('Auth stream error: ${error.toString()}'));
      },
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthState.loading());
    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Unknown error')),
      (_) => emit(AuthState.authenticated()),
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthState.loading());
    final result = await _authRepository.signUp(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Unknown error')),
      (_) => emit(AuthState.authenticated()),
    );
  }

  Future<void> signOut() async {
    emit(AuthState.loading());
    final result = await _authRepository.signOut();
    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Unknown error')),
      (_) => emit(AuthState.unauthenticated()),
    );
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}

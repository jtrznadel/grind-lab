import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/features/auth/domain/usecases/sign_in.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signIn) : super(SignInState.initial());

  final SignIn _signIn;

  void updateEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  void updatePassword({required String password}) {
    emit(state.copyWith(password: password));
  }

  Future<void> signIn() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(
        SignInState.error(
          message: 'Email and password must not be empty',
          email: state.email,
          password: state.password,
        ),
      );
      return;
    }
    emit(SignInState.loading(email: state.email, password: state.password));
    final result = await _signIn(
      SignInParams(email: state.email.trim(), password: state.password),
    );
    result.fold(
      (failure) => emit(
        SignInState.error(
          message: failure.message ?? 'An unknown error occurred',
          email: state.email,
          password: state.password,
        ),
      ),
      (_) => emit(
        SignInState.success(email: state.email, password: state.password),
      ),
    );
  }
}

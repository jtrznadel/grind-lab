import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/core/services/video_preloader_service.dart';
import 'package:grind_lab/features/auth/domain/usecases/sign_up.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUp, this._videoPreloaderService)
    : super(SignUpState.initial());

  final SignUp _signUp;
  final VideoPreloaderService _videoPreloaderService;

  void updateEmail({required String email}) {
    emit(state.copyWith(email: email));
  }

  void updatePassword({required String password}) {
    emit(state.copyWith(password: password));
  }

  void updateName({required String name}) {
    emit(state.copyWith(name: name));
  }

  Future<void> signUp() async {
    if (state.email.isEmpty || state.password.isEmpty || state.name.isEmpty) {
      emit(
        SignUpState.error(
          message: 'Name, email and password must not be empty',
          email: state.email,
          password: state.password,
          name: state.name,
        ),
      );
      return;
    }
    emit(
      SignUpState.loading(
        email: state.email,
        password: state.password,
        name: state.name,
      ),
    );
    final result = await _signUp(
      SignUpParams(
        name: state.name.trim(),
        email: state.email.trim(),
        password: state.password,
      ),
    );
    result.fold(
      (failure) => emit(
        SignUpState.error(
          message: failure.message ?? 'An unknown error occurred',
          email: state.email,
          password: state.password,
          name: state.name,
        ),
      ),
      (_) {
        _videoPreloaderService.dispose();
        emit(
          SignUpState.success(
            email: state.email,
            password: state.password,
            name: state.name,
          ),
        );
      },
    );
  }
}

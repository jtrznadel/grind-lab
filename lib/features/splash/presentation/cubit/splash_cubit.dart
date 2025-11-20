import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.empty());

  Future<void> init() async {
    //implement login logic here
    await Future.delayed(const Duration(seconds: 1));
    emit(SplashState.main());
  }
}

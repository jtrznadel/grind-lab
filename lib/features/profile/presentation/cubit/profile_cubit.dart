import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grind_lab/features/auth/domain/usecases/sign_out.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._signOut) : super(ProfileState.initial());

  final SignOut _signOut;

  Future<void> signOut() async {
    await _signOut();
  }
}

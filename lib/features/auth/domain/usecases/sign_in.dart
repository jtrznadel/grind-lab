import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/usecases/usecase.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignIn implements UsecaseWithParams<Unit, SignInParams> {
  const SignIn(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SignInParams params) async =>
      await _repository.signIn(email: params.email, password: params.password);
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}

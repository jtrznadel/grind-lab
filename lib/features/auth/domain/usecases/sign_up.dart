import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/usecases/usecase.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';

class SignUp implements Usecase<Unit, SignUpParams> {
  const SignUp(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SignUpParams params) =>
      _repository.signUp(email: params.email, password: params.password);
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}

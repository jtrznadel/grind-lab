import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/usecases/usecase.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUp implements UsecaseWithParams<Unit, SignUpParams> {
  const SignUp(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SignUpParams params) async =>
      await _repository.signUp(
        email: params.email,
        password: params.password,
        name: params.name,
      );
}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}

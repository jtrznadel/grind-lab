import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/usecases/usecase.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOut implements UsecaseWithoutParams<Unit> {
  const SignOut(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call() async => await _repository.signOut();
}

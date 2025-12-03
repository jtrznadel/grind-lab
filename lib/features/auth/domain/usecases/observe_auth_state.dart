import 'package:grind_lab/core/usecases/usecase.dart';
import 'package:grind_lab/features/auth/domain/entities/user_entity.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ObserveAuthState implements StreamUsecase<UserEntity?> {
  const ObserveAuthState(this._repository);
  final AuthRepository _repository;

  @override
  Stream<UserEntity?> call() => _repository.userStream;
}

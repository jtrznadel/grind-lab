import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, Unit>> signOut();

  Stream<UserEntity?> get userStream;
}

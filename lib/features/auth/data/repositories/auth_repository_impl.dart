import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';
import 'package:grind_lab/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:grind_lab/features/auth/domain/entities/user_entity.dart';
import 'package:grind_lab/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signIn(email: email, password: password);
      return Right(unit);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _remoteDataSource.signUp(email: email, password: password);
      return Right(unit);
    } on AuthException catch (e) {
      return Left(Failure(message: e.message));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      return Right(unit);
    } catch (e) {
      return Left(Failure(message: 'Sign out failed: ${e.toString()}'));
    }
  }

  @override
  Stream<UserEntity?> get userStream {
    return _remoteDataSource.authStateStream.map((authState) {
      final user = authState.session?.user;
      if (user == null) return null;
      return UserEntity(
        id: user.id,
        email: user.email ?? '',
        name: user.userMetadata?['name'] as String? ?? '',
      );
    });
  }
}

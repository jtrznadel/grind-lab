import 'package:fpdart/fpdart.dart';
import 'package:grind_lab/core/utils/failures/failure.dart';

abstract class UsecaseWithParams<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UsecaseWithoutParams<T> {
  Future<Either<Failure, T>> call();
}

abstract class StreamUsecase<T> {
  Stream<T> call();
}

class NoParams {
  const NoParams();
}

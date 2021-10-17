import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<List<Type>, Failure>> call(Params params);
}

abstract class UseCase2<Type, Params> {
  Future<Either<Type, Failure>> call(Params params);
}

class NoParams {}

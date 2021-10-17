import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';

abstract class RandomUserRepository {
  Future<Either<List<User>, Failure>> getRandomUsers();

  Future<Either<User, Failure>> getUserDetails(String id);
}

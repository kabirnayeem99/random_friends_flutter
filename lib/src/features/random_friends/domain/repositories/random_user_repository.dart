import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user_details.dart';

abstract class RandomUserRepository {
  Future<Either<List<User>, Failure>> getRandomUsers();
}

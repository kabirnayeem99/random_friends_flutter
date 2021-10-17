import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/repositories/random_user_repository_impl.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';

const String tag = "GetUserDetailsUseCase";

class GetUserDetailsUseCase implements UseCase2<User, String> {
  final _repo = RandomUserRepositoryImpl();

  @override
  Future<Either<User, Failure>> call(String id) async {
    final failureOrData = await _repo.getUserDetails(id);
    return failureOrData;
  }
}

import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/use_cases/use_case.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/repositories/random_user_repository_impl.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';

const String TAG = "GetUserListUseCase";

class GetUserListUseCase implements UseCase<User, NoParams> {
  final _repo = RandomUserRepositoryImpl();

  @override
  Future<Either<List<User>, Failure>> call(NoParams params) async {
    final failureOrData = await _repo.getRandomUsers();
    log("loading data in GetUserListUseCase" + failureOrData.toString(), TAG);
    return failureOrData;
  }
}

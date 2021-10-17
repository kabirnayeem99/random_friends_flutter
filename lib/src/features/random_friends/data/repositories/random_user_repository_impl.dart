import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/data_sources/random_user_remote_data_source.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/dto/random_user_response_dto.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/repositories/random_user_repository.dart';

class RandomUserRepositoryImpl implements RandomUserRepository {
  late final RandomUserRemoteDataSource _dataSource;

  RandomUserRepositoryImpl() {
    _dataSource = RandomUserRemoteDataSourceImpl();
  }

  @override
  Future<Either<List<User>, Failure>> getRandomUsers() async {
    return _getRandomUsers();
  }

  Future<Either<List<User>, Failure>> _getRandomUsers() async {
    RandomUserResponseDto response = await _dataSource.getUsers();

    try {
      List<User> userList = [];
      for (var userDto in response.results) {
        var user = User(
          {userList.length + 1}.toString(),
          userDto.picture.large,
          userDto.name.first + " " + userDto.name.last,
        );
        userList.add(user);
      }
      return Left(userList);
    } catch (e) {
      return Right(ServerFailure());
    }
  }
}

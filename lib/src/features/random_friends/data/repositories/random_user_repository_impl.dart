import 'package:dartz/dartz.dart';
import 'package:random_friends_flutter/src/core/errors/failures.dart';
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/data_sources/random_user_remote_data_source.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/dto/random_user_response_dto.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/repositories/random_user_repository.dart';

const tag = "RandomUserRepositoryImpl";

class RandomUserRepositoryImpl implements RandomUserRepository {
  static final RandomUserRepositoryImpl _singleton = RandomUserRepositoryImpl._internal();
  RandomUserRepositoryImpl._internal();
  factory RandomUserRepositoryImpl() {
    return _singleton;
  }

  late final RandomUserRemoteDataSource _dataSource;
  List<User> userList = [];



  @override
  Future<Either<List<User>, Failure>> getRandomUsers() async {
    return _getRandomUsers();
  }

  Future<Either<List<User>, Failure>> _getRandomUsers() async {
    _dataSource = RandomUserRemoteDataSourceImpl();

    RandomUserResponseDto response = await _dataSource.getUsers();

    try {
      for (var userDto in response.results) {
        final id = userList.length + 1;
        var user = User(
          id: id.toString(),
          pictureUrl: userDto.picture.large,
          name: userDto.name.first + " " + userDto.name.last,
          cell: userDto.cell,
        );
        userList.add(user);
      }
      return Left(userList);
    } catch (e) {
      return Right(ServerFailure());
    }
  }

  @override
  Future<Either<User, Failure>> getUserDetails(String id) async {
    return _getUserDetails(id);
  }

  Future<Either<User, Failure>> _getUserDetails(String id) async {
    try {
      final user = userList[int.parse(id)];
      log("the data would be for $user", tag);
      return Left(user);
    } catch (e) {
      log("Could not load $id for ${e.runtimeType}", tag);
      return Right(ServerFailure());
    }
  }
}

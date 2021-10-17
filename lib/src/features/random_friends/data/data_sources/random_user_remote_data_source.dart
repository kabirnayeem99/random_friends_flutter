import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/dto/random_user_response_dto.dart';

abstract class RandomUserRemoteDataSource {
  /// Calls the https://randomuser.me/api/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RandomUserResponseDto> getUsers();
}

class RandomUserRemoteDataSourceImpl implements RandomUserRemoteDataSource {
  late final Dio _httpClient;

  RandomUserRemoteDataSourceImpl() {
    _httpClient = Dio();
  }

  @override
  Future<RandomUserResponseDto> getUsers() async =>
      _getRandomUsers("https://randomuser.me/api/");

  Future<RandomUserResponseDto> _getRandomUsers(String url) async {
    final response = await _httpClient.get(url);

    if (response.statusCode != null && response.statusCode == 200) {
      return RandomUserResponseDto.fromJson(jsonDecode(response.data));
    } else {
      throw Exception("Could not fetch the data");
    }
  }
}

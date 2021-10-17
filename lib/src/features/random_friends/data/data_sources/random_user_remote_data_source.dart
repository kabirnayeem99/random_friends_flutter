import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_friends_flutter/src/core/utils.dart';
import 'package:random_friends_flutter/src/features/random_friends/data/dto/random_user_response_dto.dart';

const String tag = "RandomUserRemoteDataSource";

abstract class RandomUserRemoteDataSource {
  /// Calls the https://randomuser.me/api/ endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<RandomUserResponseDto> getUsers();
}

class RandomUserRemoteDataSourceImpl implements RandomUserRemoteDataSource {
  late final http.Client _httpClient;

  RandomUserRemoteDataSourceImpl() {
    _httpClient = http.Client();
  }

  @override
  Future<RandomUserResponseDto> getUsers() async =>
      _getRandomUsers(Uri.https('www.randomuser.me', '/api', {'q': '{http}', 'results': '50'}));

  Future<RandomUserResponseDto> _getRandomUsers(Uri uri) async {
    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      log(response.body.toString(), tag);
      final responseDto =
          RandomUserResponseDto.fromJson(json.decode(response.body));
      log("random user response dto is " + responseDto.toString(), tag);
      return responseDto;
    } else {
      throw Exception("Could not fetch the data");
    }
  }
}

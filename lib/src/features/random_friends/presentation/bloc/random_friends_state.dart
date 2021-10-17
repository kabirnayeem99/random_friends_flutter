import 'package:flutter/material.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';

abstract class RandomFriendsState {}

@immutable
class EmptyRandomFriendsState extends RandomFriendsState {}

class LoadingRandomFriendsState extends RandomFriendsState {}

class LoadedRandomFriendListState extends RandomFriendsState {
  late List<User> userList;

  LoadedRandomFriendListState(this.userList);
}

class LoadedFriendDetailState extends RandomFriendsState {
  late User user;

  LoadedFriendDetailState(this.user);
}


class ErrorRandomFriendsState extends RandomFriendsState {
  late String message;

  ErrorRandomFriendsState(this.message);
}

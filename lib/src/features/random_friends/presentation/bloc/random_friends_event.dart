abstract class RandomFriendsEvent {}

class LoadRandomFriendListEvent implements RandomFriendsEvent {}

class LoadFriendDetailsEvent implements RandomFriendsEvent {
  String id = "";

  LoadFriendDetailsEvent(this.id);
}

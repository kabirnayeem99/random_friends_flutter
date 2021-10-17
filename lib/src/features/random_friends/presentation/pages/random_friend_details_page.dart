import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomFriendDetailsPage extends StatelessWidget {
  static const routeName = "/randomFriendsListPage";

  const RandomFriendDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Scaffold(
        body: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_friends_flutter/src/core/widgets/circular_image_widget.dart';
import 'package:random_friends_flutter/src/features/random_friends/domain/entities/user.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/pages/random_friend_details_page.dart';

class RandomFriendsListWidget extends StatefulWidget {
  final List<User> userList;

  const RandomFriendsListWidget({required this.userList, Key? key})
      : super(key: key);

  @override
  State<RandomFriendsListWidget> createState() =>
      _RandomFriendsListWidgetState();
}

class _RandomFriendsListWidgetState extends State<RandomFriendsListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.userList.length,
      itemBuilder: (context, index) {
        final user = widget.userList[index];
        final name = user.name;
        final imageUrl = user.pictureUrl;
        final cell = user.cell;
        return InkWell(
          onTap: () =>
              Navigator.pushNamed(context, RandomFriendDetailsPage.routeName),
          child: ListTile(
            title: Text(name),
            subtitle: Text(cell),
            leading: CircularImageWidget(url: imageUrl),
          ),
        );
      },
    );
  }

  CupertinoAlertDialog showAlertDialog(BuildContext context, String name) {
    return CupertinoAlertDialog(
      title: const Text("Proceed to call"),
      content: Text("Do you want to call " + name + "?"),
      actions: <CupertinoDialogAction>[
        const CupertinoDialogAction(
          child: Text('Call'),
        ),
        CupertinoDialogAction(
          child: const Text('Cancel'),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

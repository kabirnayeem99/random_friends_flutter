import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/pages/random_friend_details_page.dart';
import 'package:random_friends_flutter/src/features/random_friends/presentation/pages/random_friends_list_page.dart';

import 'core/settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      restorationScopeId: 'app',
      onGenerateRoute: (RouteSettings routeSettings) {
        return CupertinoPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case RandomFriendDetailsPage.routeName:
                return const RandomFriendDetailsPage();
              default:
                return const RandomFriendsListPage();
            }
          },
        );
      },
    );
  }
}

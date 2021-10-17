import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/settings/settings_controller.dart';
import 'features/random_friends/presentation/pages/random_friend_details_page.dart';
import 'features/random_friends/presentation/pages/random_friends_list_page.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_friends_flutter/src/core/settings/settings_controller.dart';
import 'package:random_friends_flutter/src/core/settings/settings_service.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(BaseApp(settingsController: settingsController));
}

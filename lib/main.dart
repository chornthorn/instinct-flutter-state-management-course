import 'package:flutter/material.dart';

import 'helpers/base_change_notifier_provider.dart';
import 'providers/config_model.dart';
import 'providers/home_change_notifier.dart';
import 'providers/post_change_notifier_provider.dart';
import 'providers/user_provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    ConfigModel(
      config: const {
        'title': 'Flutter State Management',
        'appBarColor': Colors.red,
        'name': 'Flutter',
      },
      child: MultiChangeNotifierProvider(
        changeNotifiers: [
          HomeChangeNotifier(),
          PostChangeNotifierProvider(),
          UserChangeNotifier(),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

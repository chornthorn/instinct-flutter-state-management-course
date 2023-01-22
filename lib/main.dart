import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/home_provider.dart';
import 'package:flutter_state_management/providers/post_provider.dart';
import 'package:flutter_state_management/providers/user_provider.dart';
import 'package:flutter_state_management/views/main_page.dart';
import 'package:provider/provider.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeChangeNotifier()),
        ChangeNotifierProvider(create: (_) => PostChangeNotifierProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

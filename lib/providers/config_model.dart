import 'package:flutter/cupertino.dart';

// user defined type or custom type
class ConfigModel extends InheritedWidget {
  const ConfigModel({
    Key? key,
    required Widget child,
    required this.config,
  }) : super(key: key, child: child);

  final Map<String, dynamic> config;

  static ConfigModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConfigModel>()!;
  }

  @override
  bool updateShouldNotify(ConfigModel oldWidget) {
    return config != oldWidget.config;
  }
}

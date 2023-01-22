import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends InheritedWidget {
  const ChangeNotifierProvider({
    Key? key,
    required this.changeNotifier,
    required Widget child,
  }) : super(key: key, child: child);

  final T changeNotifier;

  static T of<T extends ChangeNotifier>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>();
    assert(provider != null, 'No ChangeNotifierProvider found in context');
    return provider!.changeNotifier;
  }

  @override
  bool updateShouldNotify(ChangeNotifierProvider<T> oldWidget) =>
      changeNotifier != oldWidget.changeNotifier;
}

class MultiChangeNotifierProvider extends InheritedWidget {
  const MultiChangeNotifierProvider({
    Key? key,
    required this.changeNotifiers,
    required Widget child,
  }) : super(key: key, child: child);

  final List<ChangeNotifier> changeNotifiers;

  static T of<T extends ChangeNotifier>(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<MultiChangeNotifierProvider>();
    assert(provider != null, 'No MultiChangeNotifierProvider found in context');
    return provider!.changeNotifiers.firstWhere((element) => element is T) as T;
  }

  @override
  bool updateShouldNotify(MultiChangeNotifierProvider oldWidget) =>
      changeNotifiers != oldWidget.changeNotifiers;
}

// create extension of MultiChangeNotifierProvider for easy access
extension MultiChangeNotifierProviderExtension on BuildContext {
  T getProvider<T extends ChangeNotifier>() =>
      MultiChangeNotifierProvider.of<T>(this);
}

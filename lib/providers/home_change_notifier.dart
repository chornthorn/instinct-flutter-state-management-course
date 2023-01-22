import 'package:flutter/material.dart';

class HomeChangeNotifier extends ChangeNotifier {
  int _counter = 0; // private variable

  int get counter => _counter; // getter

  void incrementCounter() {
    print('clicked');
    _counter++; // increment counter
    notifyListeners();
  }
}

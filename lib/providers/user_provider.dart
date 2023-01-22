import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String password;

  User({required this.name, required this.email, required this.password});

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password}';
  }
}

class UserChangeNotifier extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    print(user.toString());
    _user = user;
    notifyListeners();
  }
}

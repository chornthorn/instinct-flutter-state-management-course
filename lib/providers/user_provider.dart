import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/user_service.dart';

class UserProvider with ChangeNotifier {
  final userService = UserService();

  List<UserModel> _userList = [];
  bool _isLoading = false;

  // getter of user
  List<UserModel> get userList => _userList; // <-- this is the getter
  bool get isLoading => _isLoading;

  // setter of user
  set userList(List<UserModel> userList) {
    _userList = userList;
    notifyListeners();
  }

  // method to fetch users
  Future<void> fetchUsers() async {
    try {
      _isLoading = true;
      notifyListeners();

      final users = await userService.getUsers();
      userList = users;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

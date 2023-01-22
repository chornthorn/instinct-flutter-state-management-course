import 'package:flutter/material.dart';
import 'package:flutter_state_management/services/post_service.dart';

import '../models/post_model.dart';

class PostChangeNotifierProvider extends ChangeNotifier {
  final PostService _postService = PostService(); // <-- PostService instance

  List<PostModel> _posts = <PostModel>[]; // <-- List of posts, initially empty list
  bool _isLoading = false; // private variable to track loading state

  List<PostModel> get posts => _posts; // <-- getter for posts

  bool get isLoading => _isLoading; // <-- getter for isLoading

  void fetchPosts() async {
    _isLoading = true;
    notifyListeners(); // <-- notify listeners that isLoading has changed

    _posts = await _postService.getPosts(); // <-- fetch posts from PostService
    _isLoading = false;
    notifyListeners();
  }
}

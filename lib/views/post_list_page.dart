import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/post_provider.dart';
import 'package:provider/provider.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostChangeNotifierProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => postProvider.fetchPosts(),
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: AnimatedBuilder(
        animation: postProvider,
        builder: (context, child) {
          if (postProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: postProvider.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${postProvider.posts[index].id}'),
                  title: Text(
                    postProvider.posts[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(postProvider.posts[index].body),
                );
              },
            );
          }
        },
      ),
    );
  }
}

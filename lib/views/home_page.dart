import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/config_model.dart';
import 'package:flutter_state_management/providers/home_change_notifier.dart';
import 'package:flutter_state_management/views/post_list_page.dart';

import '../helpers/base_change_notifier_provider.dart';
import '../providers/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('HomePage build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConfigModel.of(context).config['appBarColor'],
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: _HomeBody(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final userProvider = context.getProvider<UserChangeNotifier>();
          final user =
              User(name: "Thorn", email: "thorn@gmail.com", password: "123456");
          userProvider.setUser(user);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.getProvider<HomeChangeNotifier>();
    final userProvider = context.getProvider<UserChangeNotifier>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: homeProvider,
          builder: (context, child) {
            print('AnimatedBuilder build');
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hello ${ConfigModel.of(context).config['name']}',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'You push many times: ${homeProvider.counter} times',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    homeProvider.incrementCounter();
                  },
                  child: const Text('Increment'),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        AnimatedBuilder(
          animation: userProvider,
          builder: (context, child) {
            return Text('User name: ${userProvider.user?.name ?? 'No name'}');
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => const PostListPage(),
            );
            Navigator.push(context, route);
          },
          child: const Text('Go to Post List'),
        ),
      ],
    );
  }
}

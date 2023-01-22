// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_state_management/providers/home_provider.dart';
// import 'package:flutter_state_management/views/post_list_page.dart';
// import 'package:provider/provider.dart';
// import '../providers/user_provider.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print('HomePage build');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: const Center(
//         child: Padding(
//           padding: EdgeInsets.all(32.0),
//           child: _HomeBody(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           final userProvider = context.read<UserChangeNotifier>();
//           final user = User(
//               name: "Flutter State",
//               email: "thorn@gmail.com",
//               password: "123456");
//           userProvider.setUser(user);
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class _HomeBody extends StatelessWidget {
//   const _HomeBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final homeProvider = context.read<HomeChangeNotifier>();
//     final userProvider =
//         Provider.of<UserChangeNotifier>(context, listen: false);
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         AnimatedBuilder(
//           animation: homeProvider,
//           builder: (context, child) {
//             print('AnimatedBuilder build');
//             return Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'You push many times: ${homeProvider.counter} times',
//                   style: const TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     homeProvider.incrementCounter();
//                   },
//                   child: const Text('Increment'),
//                 ),
//               ],
//             );
//           },
//         ),
//         const SizedBox(height: 20),
//         AnimatedBuilder(
//           animation: userProvider,
//           builder: (context, child) {
//             return Text('User name: ${userProvider.user?.name ?? 'No name'}');
//           },
//         ),
//         const SizedBox(height: 20),
//         Consumer<UserChangeNotifier>(
//           builder: (context, userProvider, child) {
//             return Text(
//                 'User email: ${userProvider.user?.email ?? 'No email'}');
//           },
//         ),
//         const SizedBox(height: 20),
//         UserInputEmailWidget(
//           onChanged: (value) {
//             userProvider.setUserEmail(value);
//           },
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             MaterialPageRoute route = MaterialPageRoute(
//               builder: (context) => const PostListPage(),
//             );
//             Navigator.push(context, route);
//           },
//           child: const Text('Go to Post List'),
//         ),
//       ],
//     );
//   }
// }
//
// class UserInputEmailWidget extends StatefulWidget {
//   const UserInputEmailWidget({Key? key, required this.onChanged})
//       : super(key: key);
//
//   final ValueChanged<String> onChanged;
//
//   @override
//   State<UserInputEmailWidget> createState() => _UserInputEmailWidgetState();
// }
//
// class _UserInputEmailWidgetState extends State<UserInputEmailWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: widget.onChanged,
//       decoration: const InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: 'Email',
//       ),
//     );
//   }
// }

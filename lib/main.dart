import 'package:flutter/material.dart';
// import 'screens/login.dart';
import 'screens/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),

      // Login(),
    );
  }
}

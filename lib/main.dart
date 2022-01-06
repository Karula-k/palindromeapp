import 'package:flutter/material.dart';
import 'package:palindromeapp/screens/home_screen.dart';
import 'package:palindromeapp/screens/list_user.dart';
import 'package:palindromeapp/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routeNamed,
      //route
      routes: {
        LoginScreen.routeNamed: (context) => const LoginScreen(),
        HomeScreen.routeNamed: (context) => const HomeScreen(),
        ListUserScreen.routeNamed: (contex) => const ListUserScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:palindromeapp/model/user_model.dart';
import 'package:palindromeapp/provider/palindrom_provider.dart';
import 'package:palindromeapp/screens/home_screen.dart';
import 'package:palindromeapp/screens/list_user.dart';
import 'package:palindromeapp/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PalindromProvider>(
            create: (_) => PalindromProvider())
      ],
      builder: (context, child) => MaterialApp(
        initialRoute: LoginScreen.routeNamed,
        //route
        routes: {
          LoginScreen.routeNamed: (context) => LoginScreen(),
          HomeScreen.routeNamed: (context) => HomeScreen(
                model: ModalRoute.of(context)?.settings.arguments as UserModel,
              ),
          ListUserScreen.routeNamed: (contex) => const ListUserScreen(),
        },
      ),
    );
  }
}

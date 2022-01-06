import 'package:flutter/material.dart';
import 'package:palindromeapp/model/user_model.dart';
import 'package:palindromeapp/provider/api_user_provider.dart';
import 'package:palindromeapp/resources/api/api_user.dart';
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
        ChangeNotifierProvider<ApiUserProvider>(
            create: (_) => ApiUserProvider(apiService: ApiService()))
      ],
      builder: (context, child) => MaterialApp(
        initialRoute: LoginScreen.routeNamed,
        //route
        routes: {
          LoginScreen.routeNamed: (context) => const LoginScreen(),
          HomeScreen.routeNamed: (context) => HomeScreen(
                model: ModalRoute.of(context)?.settings.arguments as UserModel,
              ),
          ListUserScreen.routeNamed: (contex) => ListUserScreen(
                username: ModalRoute.of(context)?.settings.arguments as String,
              ),
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palindromeapp/model/user_model.dart';
import 'package:palindromeapp/screens/list_user.dart';
import 'package:palindromeapp/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final UserModel model;
  static const routeNamed = "/home_screen";
  const HomeScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeNamed);
          },
        ),
        title: const Text(
          "Second Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Welcome"),
                    Text(
                      model.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal[800])),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ListUserScreen(username: model.username)));
                    },
                    child: const Text("Choose a user")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

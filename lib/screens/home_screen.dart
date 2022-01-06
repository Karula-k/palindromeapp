import 'package:flutter/material.dart';
import 'package:palindromeapp/screens/list_user.dart';

class HomeScreen extends StatelessWidget {
  static const routeNamed = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: const BackButton(
          color: Colors.black,
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
              child: Column(
                children: const <Widget>[Text("Welcome"), Text("nama user 1")],
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text("NAMA Placeholder"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ListUserScreen.routeNamed);
                  },
                  child: const Text("Choose user")),
            ),
          ],
        ),
      ),
    );
  }
}

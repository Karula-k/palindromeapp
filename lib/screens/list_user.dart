import 'package:flutter/material.dart';

class ListUserScreen extends StatefulWidget {
  static const routeNamed = "/list_user";
  const ListUserScreen({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUserScreen> {
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
          "Third Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("nama"),
            subtitle: Text("email"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:palindromeapp/screens/home_screen.dart';
import 'package:palindromeapp/widget/background_scaffold.dart';

class LoginScreen extends StatelessWidget {
  static const routeNamed = '/login_route';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        image: const AssetImage('assets/background.png'),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/btn_add_photo.png',
                width: 120,
                height: 120,
              ),
              const TextColumn(),
              const ListButton(),
            ],
          ),
        ));
  }
}

//all TextField widget
class TextColumn extends StatelessWidget {
  const TextColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Name",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Palindrom",
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//all Button widget
class ListButton extends StatelessWidget {
  const ListButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          width: width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {},
            child: const Text(
              "CHECK",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.8,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.routeNamed);
            },
            child: const Text(
              "NEXT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:palindromeapp/model/user_model.dart';
import 'package:palindromeapp/provider/palindrom_provider.dart';
import 'package:palindromeapp/screens/home_screen.dart';
import 'package:palindromeapp/widget/background_scaffold.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeNamed = '/login_route';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controlerPalindrom = TextEditingController();

  final _controlerUser = TextEditingController();

  @override
  void dispose() {
    _controlerPalindrom.dispose();
    _controlerUser.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      image: const AssetImage('assets/background.png'),
      child: Center(
          child: ChangeNotifierProvider<PalindromProvider>(
        create: (_) => PalindromProvider(),
        builder: (context, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/btn_add_photo.png',
              width: 120,
              height: 120,
            ),
            TextColumn(
              controllerPalindrom: _controlerPalindrom,
              controllerUser: _controlerUser,
            ),
            ListButton(
              controllerPalindrom: _controlerPalindrom,
              controllerUser: _controlerUser,
            ),
          ],
        ),
      )),
    );
  }
}

//all TextField widget
class TextColumn extends StatelessWidget {
  final TextEditingController controllerPalindrom;
  final TextEditingController controllerUser;
  const TextColumn(
      {Key? key,
      required this.controllerUser,
      required this.controllerPalindrom})
      : super(key: key);

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
              controller: controllerUser,
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
              controller: controllerPalindrom,
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
  final TextEditingController controllerPalindrom;
  final TextEditingController controllerUser;
  const ListButton(
      {Key? key,
      required this.controllerPalindrom,
      required this.controllerUser})
      : super(key: key);

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
            onPressed: () {
              String textTest = controllerPalindrom.text;
              controllerPalindrom.clear();
              if (textTest.isNotEmpty) {
                var text =
                    Provider.of<PalindromProvider>(context, listen: false)
                        .palindromCheck(textTest);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          title: const Text(""),
                          content: Text("$textTest $text"),
                          actions: [
                            TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ]),
                    );
                  },
                );
              }
            },
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
              if (controllerUser.text.isNotEmpty) {
                Navigator.of(context).pushNamed(HomeScreen.routeNamed,
                    arguments: UserModel(
                        username: controllerUser.text,
                        name: "No User is Selected"));
                controllerUser.clear();
              }
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

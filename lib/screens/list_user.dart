import 'package:flutter/material.dart';
import 'package:palindromeapp/model/user.dart';
import 'package:palindromeapp/model/user_model.dart';
import 'package:palindromeapp/provider/api_user_provider.dart';
import 'package:palindromeapp/resources/enum/enum_check.dart';
import 'package:palindromeapp/screens/home_screen.dart';
import 'package:palindromeapp/widget/profile_picture.dart';
import 'package:provider/provider.dart';

class ListUserScreen extends StatefulWidget {
  final String username;
  static const routeNamed = "/list_user";
  const ListUserScreen({Key? key, required this.username}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUserScreen> {
  int number = 0;
  @override
  void initState() {
    super.initState();
  }

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
        body: Consumer<ApiUserProvider>(
          builder: (context, result, _) {
            if (result.state == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (result.state == ResultState.hasData ||
                result.state == ResultState.endCheck) {
              return RefreshIndicator(
                onRefresh: () async {
                  number = 0;
                  return Provider.of<ApiUserProvider>(context, listen: false)
                      .update();
                },
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollinfo) {
                    if (scrollinfo.metrics.pixels >=
                            scrollinfo.metrics.maxScrollExtent &&
                        result.state == ResultState.hasData) {
                      Provider.of<ApiUserProvider>(context, listen: false)
                          .nextPage(number);
                      number += 1;
                    }
                    return false;
                  },
                  child: ListView.builder(
                      itemCount: result.list.length + 1,
                      itemBuilder: (context, index) {
                        return index == result.list.length
                            ? const Center(
                                child: Text("you have reached last page"))
                            : UserTile(
                                data: result.list[index],
                                user: widget.username,
                              );
                      }),
                ),
              );
            } else if (result.state == ResultState.noData) {
              return Center(child: Text(result.massage));
            } else if (result.state == ResultState.error) {
              return Center(child: Text(result.massage));
            } else {
              return const Center(child: Text("Something wrong"));
            }
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    number = 0;
  }
}

class UserTile extends StatelessWidget {
  final String user;
  final UserData data;
  const UserTile({
    Key? key,
    required this.data,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          HomeScreen.routeNamed,
          arguments: UserModel(
              name: '${data.firstName} ${data.lastName}', username: user),
        );
      },
      leading: ProfilePicture(linkImg: data.avatar, size: 50),
      title: Text(
        '${data.firstName} ${data.lastName}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        data.email,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

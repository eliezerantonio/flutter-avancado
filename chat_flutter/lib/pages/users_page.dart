import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:chat_flutter/services/users_service.dart';
import 'package:chat_flutter/widegts/search_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final userService = context.watch<UsersService>();

    final filteresUser = userService.filteredUsers;
    return Scaffold(
      body: Consumer<UsersService>(
        builder: (_, userService, __) {
          return SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _cargarusers,
            child: SafeArea(
              child: Container(
                color: Color(0xff060a37),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: FaIcon(
                                FontAwesomeIcons.facebookMessenger,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Conversas",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Consumer<UsersService>(
                              builder: (_, userService, __) {
                                if (userService.search.isEmpty) {
                                  return Container(
                                      width: 35,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.search,
                                          color: Colors.white,
                                        ),
                                        onPressed: () async {
                                          final search =
                                              await showDialog<String>(
                                                  context: context,
                                                  builder: (_) => SearchDialog(
                                                      userService.search));
                                          if (search != null) {
                                            userService.search = search;
                                          }
                                        },
                                      ));
                                } else {
                                  return Container(
                                    width: 35,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        userService.search = '';
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              flex: 6,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (_, index) =>
                                    _userListTile(filteresUser[index]),
                                separatorBuilder: (_, index) => Divider(),
                                itemCount: filteresUser.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      onTap: () {
        final chatService = context.read<ChatService>();
        chatService.userTo = user;

        Navigator.pushNamed(context, "chat");
      },
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
          child: Text(user.name.substring(0, 2)),
          backgroundColor: Colors.blue[100]),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: user.online ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  void _cargarusers() async {
    context.read<UsersService>().getUsers();

    setState(() {});
    _refreshController.refreshCompleted();
  }
}

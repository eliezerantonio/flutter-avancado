import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:chat_flutter/services/users_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final userService = UsersService();

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    this._cargarusers();
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final socketService = context.watch<SocketService>();
    final user = authService.user;
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarusers,
        child: SafeArea(child: _listViewusers()),
      ),
    );
  }

  Widget _listViewusers() {
    return Container(
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
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: FaIcon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
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
                  Expanded(
                    child: usersHorizontal(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 6,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (_, index) => _userListTile(users[index]),
                      separatorBuilder: (_, index) => Divider(),
                      itemCount: users.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView usersHorizontal() {
    return ListView.builder(
      reverse: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) => Container(
        margin: EdgeInsets.all(7),
        child: GestureDetector(
          onTap: () {
            final chatService = context.read<ChatService>();
            chatService.userTo = users[index];

            Navigator.pushNamed(context, "chat");
          },
          child: CircleAvatar(
              child: Text(users[index].name.substring(0, 2)),
              backgroundColor: Colors.blue[100]),
        ),
      ),
      itemCount: users.length,
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
    this.users = await userService.getUsers();

    setState(() {});
    _refreshController.refreshCompleted();
  }
}

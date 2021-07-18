import 'package:chat_flutter/models/user.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsersPage extends StatelessWidget {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final users = [
    User(uid: '1', name: 'Eliezer', email: "eliezer@gmail.com", online: true),
    User(uid: '3', name: 'Jose', email: "jose@gmail.com", online: true),
    User(uid: '4', name: 'Vasco', email: "vasco@gmail.com", online: true),
    User(
        uid: '2',
        name: 'Goncalves',
        email: "goncalves@gmail.com",
        online: false),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final socketService = context.watch<SocketService>();
    final user = authService.user;
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name, style: TextStyle(color: Colors.black)),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
          onPressed: () {
            AuthService.deleteToken();
            socketService.disconnect();
            Navigator.pushReplacementNamed(context, "login");
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.Online)
                ? Icon(
                    Icons.check_circle,
                    color: Colors.blue[400],
                  )
                : Icon(
                    Icons.offline_bolt,
                    color: Colors.red,
                  ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarusers,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ),
        child: _listViewusers(),
      ),
    );
  }

  ListView _listViewusers() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, index) => _userListTile(users[index]),
      separatorBuilder: (_, index) => Divider(),
      itemCount: users.length,
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
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
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}

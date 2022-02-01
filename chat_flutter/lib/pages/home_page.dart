import 'package:chat_flutter/pages/conversation.page.dart';
import 'package:chat_flutter/pages/users_page.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    UsersPage(),
    ConversationPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final socketService = context.watch<SocketService>();
    final user = authService.user;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(user.name, style: TextStyle(color: Colors.black)),
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.exit_to_app,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       AuthService.deleteToken();
      //       socketService.disconnect();
      //       Navigator.pushReplacementNamed(context, "login");
      //     },
      //   ),
      //   actions: [
      //     Container(
      //       margin: EdgeInsets.only(right: 10),
      //       child: (socketService.serverStatus == ServerStatus.Online)
      //           ? Icon(
      //               Icons.check_circle,
      //               color: Colors.blue[400],
      //             )
      //           : Icon(
      //               Icons.offline_bolt,
      //               color: Colors.red,
      //             ),
      //     )
      //   ],
      // ),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        iconSize: 25,
        selectedIndex: _selectedIndex,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.users),
            title: Text('Pessoas'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.facebookMessenger),
            title: Text('Conversas'),
          ),
          FlashyTabBarItem(
            icon: Icon(FontAwesomeIcons.slidersH),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/src/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final user = authService.user;
    final socketService = context.watch<SocketService>();
    return SafeArea(
      child: Container(
        color: Color(0xff060a37),
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                        "Definições",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthService.deleteToken();
                          socketService.disconnect();
                          Navigator.pushReplacementNamed(context, "login");
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  color: Colors.grey[100],
                ),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 19,
                        ),
                        CircleAvatar(
                          child: Text(user.name.substring(0, 2)),
                          backgroundColor: Colors.blue[100],
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customIcon(
                                faIcon: FontAwesomeIcons.solidMoon,
                                color: Colors.white,
                                background: Colors.black,
                                text: 'Dark Mode',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.exit_to_app,
                                color: Colors.white,
                                background: Colors.greenAccent,
                                text: 'conexao',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.email,
                                color: Colors.white,
                                background: Colors.purpleAccent,
                                text: 'E-mail',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: FontAwesomeIcons.phone,
                                color: Colors.white,
                                background: Colors.blue,
                                text: 'Telefone',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.exit_to_app,
                                color: Colors.white,
                                background: Colors.red,
                                text: 'Sair',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customIcon(
                                faIcon: FontAwesomeIcons.solidMoon,
                                color: Colors.white,
                                background: Colors.black,
                                text: 'Dark Mode',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.exit_to_app,
                                color: Colors.white,
                                background: Colors.greenAccent,
                                text: 'conexao',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.email,
                                color: Colors.white,
                                background: Colors.purpleAccent,
                                text: 'E-mail',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: FontAwesomeIcons.phone,
                                color: Colors.white,
                                background: Colors.blue,
                                text: 'Telefone',
                              ),
                              Divider(),
                              customIcon(
                                faIcon: Icons.exit_to_app,
                                color: Colors.white,
                                background: Colors.red,
                                text: 'Sair',
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customIcon(
      {IconData faIcon, Color color, Color background, String text}) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: background, borderRadius: BorderRadius.circular(20)),
          child: FaIcon(
            faIcon,
            color: color,
            size: 20,
          ),
        ),
        Text(text),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
        )
      ],
    );
  }
}

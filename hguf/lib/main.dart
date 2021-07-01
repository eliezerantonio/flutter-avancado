import 'package:flutter/material.dart';
import 'package:ionic/model/user.dart';
import 'package:ionic/screens/home_screen.dart';
import 'package:ionic/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => User(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LOGIN_SCREEN,
        routes: {
          HOME_SCREEN: (_) => HomeScreen(),
          LOGIN_SCREEN: (_) => LoginScreen(),
        },
      ),
    );
  }
}

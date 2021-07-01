import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "E-mail",
            ),
          ),
          SizedBox(
            height: 14,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            height: 44,
            child: RaisedButton(
              child: Text("Entrar"),
              onPressed: () {},
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:ionic/model/user.dart';
import 'package:ionic/screens/home_screen.dart';
import 'package:provider/provider.dart';

final LOGIN_SCREEN = "/login_screen";

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);
  final userModel = User();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    onSuccess() {
      Navigator.pushReplacementNamed(context, HOME_SCREEN);
    }

    onFailed() {}

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onSaved: (email) => userModel.email = email,
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
                onSaved: (password) => userModel.password = password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              SizedBox(height: 14),
              Consumer<User>(
                builder: (_, user, __) {
                  return Column(
                    children: [
                      Container(
                        height: 44,
                        child: RaisedButton(
                          child: Text("Entrar"),
                          onPressed: () {
                            formKey.currentState.save();
                            user.login(userModel, onSuccess, onFailed);
                          },
                        ),
                      ),
                      if (user.loading) CircularProgressIndicator()
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

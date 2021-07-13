import 'package:chat_flutter/widegts/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Logo(),
            _Form(),
            _Labels(),
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/tag-logo.png'),
            ),
            Text(
              "Messenger",
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'E-mail',
            textController: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Password',
            textController: _passwordController,
            keyboardType: TextInputType.emailAddress,
          ),
          RaisedButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Nao tem conta?",
        style: TextStyle(
          color: Colors.black45,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "Criar uma agora",
        style: TextStyle(
          color: Colors.blue[600],
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "Termos e condicoes de uso",
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}

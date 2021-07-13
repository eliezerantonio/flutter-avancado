import 'package:chat_flutter/widegts/custom_input.dart';
import 'package:chat_flutter/widegts/labela.dart';
import 'package:chat_flutter/widegts/logo.dart';
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
            Logo(),
            _Form(),
            Labels(),
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
            isPassword: true,
            icon: Icons.lock_outlined,
            placeholder: 'password',
            textController: _passwordController,
            keyboardType: TextInputType.emailAddress,
          ),
          
        ],
      ),
    );
  }
}

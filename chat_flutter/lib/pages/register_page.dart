import 'package:chat_flutter/widegts/custom_button.dart';
import 'package:chat_flutter/widegts/custom_input.dart';
import 'package:chat_flutter/widegts/labela.dart';
import 'package:chat_flutter/widegts/logo.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(title: "Registro"),
                _Form(),
                Labels(
                  route: 'login',
                ),
              ],
            ),
          ),
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
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nome',
            textController: _nameController,
            keyboardType: TextInputType.text,
          ),
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
          CustomButton(
            onPressed: () {},
            text: "Entrar",
          )
        ],
      ),
    );
  }
}

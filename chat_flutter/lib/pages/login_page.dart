import 'package:chat_flutter/helpers/show_alert.dart';
import 'package:chat_flutter/services/auth_service.dart';
import 'package:chat_flutter/services/socket_service.dart';
import 'package:chat_flutter/widegts/custom_button.dart';
import 'package:chat_flutter/widegts/custom_input.dart';
import 'package:chat_flutter/widegts/labela.dart';
import 'package:chat_flutter/widegts/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
                Logo(title: "Chat"),
                _Form(),
                Labels(
                  createAccount: "Nao tem uma conta?",
                  haveAccount: "Criar Agora",
                  route: 'register',
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
  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    final socketService = context.watch<SocketService>();
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
          CustomButton(
            onPressed: !authService.loading
                ? () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );

                    if (loginOk) {
                      socketService.connect();
                      Navigator.pushReplacementNamed(context, "home");
                    } else {
                      //   mostrar alerta
                      showAlert(
                        context,
                        "Login incorreto",
                        'Verifique seus credencias',
                      );
                    }
                  }
                : null,
            text: "Entrar",
          )
        ],
      ),
    );
  }
}

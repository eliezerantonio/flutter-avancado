import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(
      {Key key, @required this.route, this.haveAccount, this.createAccount})
      : super(key: key);
  final String route;
  final String haveAccount;
  final String createAccount;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        haveAccount,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(this.route);
        },
        child: Text(
          createAccount,
          style: TextStyle(
            color: Colors.blue[600],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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

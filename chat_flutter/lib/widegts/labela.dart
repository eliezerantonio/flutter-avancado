import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key key}) : super(key: key);

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

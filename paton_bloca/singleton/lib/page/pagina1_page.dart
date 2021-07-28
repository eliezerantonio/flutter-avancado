import 'package:flutter/material.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
      ),
      body: InfromationUsuario(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "pagina2");
        },
        child: Icon(Icons.near_me),
      ),
    );
  }
}

class InfromationUsuario extends StatelessWidget {
  const InfromationUsuario({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Geral',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Nome: "),
          ),
          ListTile(
            title: Text("Idade: "),
          ),
          Text(
            'Profisao',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Profisao 1: "),
          ),
          ListTile(
            title: Text("Profisao 1: "),
          ),
          ListTile(
            title: Text("Profisao 1: "),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? InfromationUsuario(snapshot.data)
              : Center(child: Text("Sem  informacao de usuario"));
        },
      ),
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
  final Usuario usuario;
  const InfromationUsuario(this.usuario);

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
            title: Text("Nome : ${usuario.nome}"),
          ),
          ListTile(
            title: Text("Idade: ${usuario.idade} "),
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


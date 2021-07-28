import 'package:flutter/material.dart';
import 'package:singleton/models/usuario.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data.nome)
                : Text("Pagina2");
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {
                final novoUsuario = new Usuario(
                  nome: "Eliezer Antonio",
                  idade: 23,
                  profisoes: [],
                );
                usuarioService.cargarUsuario(novoUsuario);
              },
              child: Text(
                "Estabelecer usuario",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {
                usuarioService.setarIdade(24);
              },
              child: Text(
                "Digita idade",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                "Anadir profissao",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

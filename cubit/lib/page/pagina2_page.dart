import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {
                final newUser = new Usuario(
                  nome: 'Eliezer Antonio',
                  idade: 23,
                  profisoes: [
                    'Mobile developer',
                    'Back-end developer',
                  ],
                );
                context.bloc<UsuarioCubit>().selecionarUsuario(newUser);
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
                context.bloc<UsuarioCubit>().completarIdade(24);
              },
              child: Text(
                "Completar idade",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue[500],
              textColor: Colors.white,
              onPressed: () {

                 context.bloc<UsuarioCubit>().agregarProfisao();
              },
              child: Text(
                "Agregar profissao",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

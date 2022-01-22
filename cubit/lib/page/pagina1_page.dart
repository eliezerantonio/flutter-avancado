import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/usuario/usuario_cubit.dart';
import 'package:singleton/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              context.bloc<UsuarioCubit>().borrarUsuario();
            },
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "pagina2");
        },
        child: Icon(Icons.near_me),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (BuildContext context, state) {
        if (state is UsuarioInitial) {
          return Center(
            child: Text("Nao existe informacao"),
          );
        } else if (state is UsuarioActivo) {
          return InfromationUsuario(state.usuario);
        } else {
          return Center(child: Text("Estado nao reconhecido"));
        }
      },
    );
  }
}

class InfromationUsuario extends StatelessWidget {
  const InfromationUsuario(this.usuario);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
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
            Divider(),
            ListTile(
              title: Text("Nome: ${usuario.nome} "),
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
            ...usuario.profisoes
                .map(
                  (profisao) => ListTile(
                    title: Text(profisao),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}

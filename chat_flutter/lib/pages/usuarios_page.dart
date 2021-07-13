import 'package:chat_flutter/pages/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatelessWidget {
  final usuarios = [
    Usuario(
        uid: '1', name: 'Eliezer', email: "eliezer@gmail.com", online: true),
    Usuario(
        uid: '2',
        name: 'Goncalves',
        email: "goncalves@gmail.com",
        online: false),
    Usuario(uid: '3', name: 'Jose', email: "jose@gmail.com", online: true),
    Usuario(uid: '4', name: 'Vasco', email: "vasco@gmail.com", online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MeuNome", style: TextStyle(color: Colors.black)),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[400],
            ),
          )
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) => ListTile(
          title: Text(usuarios[index].name),
          leading: CircleAvatar(
            child: Text(usuarios[index].name.substring(0, 2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: usuarios[index].online ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
        separatorBuilder: (_, index) => Divider(),
        itemCount: usuarios.length,
      ),
    );
  }
}

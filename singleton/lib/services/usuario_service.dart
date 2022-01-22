import 'dart:async';

import 'package:singleton/models/usuario.dart';

class _UsuarioService {
  Usuario _usuario;

  StreamController<Usuario> _usuarioStreamController =
      new StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario get usuario => this._usuario;

  set usuario(Usuario value) => this._usuario = value;
  bool get existUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario user) {
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void setarIdade(int idade) {
    this._usuario.idade = idade;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose() {
    _usuarioStreamController?.close();
  }
}

final usuarioService = new _UsuarioService();

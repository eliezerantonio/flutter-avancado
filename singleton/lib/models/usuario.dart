import 'package:meta/meta.dart';

class Usuario {
  String nome;
  int idade;
  List<String> profisoes;

  Usuario({@required this.nome, this.idade, this.profisoes})
      : assert(nome != null);
}

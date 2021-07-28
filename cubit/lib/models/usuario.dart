import 'package:meta/meta.dart';

class Usuario {
  final String nome;
  final int idade;
  final List<String> profisoes;

  Usuario({this.nome, this.idade, this.profisoes});

  Usuario copyWith({String nome, int idade, List<String> profisoes}) {
    return Usuario(
      idade: idade ?? this.idade,
      nome: nome ?? this.nome,
      profisoes: profisoes ?? this.profisoes,
    );
  }
}

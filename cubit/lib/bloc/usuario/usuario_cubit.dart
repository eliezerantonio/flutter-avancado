import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void selecionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void completarIdade(int idade) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(idade: idade);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfisao() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newProfissions = [
        ...currentState.usuario.profisoes,
        'Profissoes ${currentState.usuario.profisoes.length + 1} '
      ];

      final newUser = currentState.usuario.copyWith(profisoes: newProfissions);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}

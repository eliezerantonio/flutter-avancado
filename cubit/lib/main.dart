import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/usuario/usuario_cubit.dart';
import 'page/pagina1_page.dart';
import 'page/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) =>UsuarioCubit()),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => new Pagina1Page(),
          'pagina2': (_) => new Pagina2Page(),
        },
      ),
    );
  }
}

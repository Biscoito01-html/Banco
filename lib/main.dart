import 'package:banco/pages/Clientes/conta_geral_apresentacao.dart';
import 'package:banco/pages/Clientes/detalhar_conta_corrente.dart';
import 'package:banco/pages/Clientes/detalhar_conta_credito.dart';
import 'package:banco/pages/Clientes/detalhar_conta_poupanca.dart';
import 'package:banco/pages/Formularios/formulario_conta.dart';
import 'package:banco/pages/Formularios/formulario_funcionario.dart';

import 'package:banco/pages/Clientes/home_page.dart';
import 'package:banco/pages/Funcionarios/funcionarios_view.dart';
import 'package:banco/pages/Gerente/gerente_view.dart';
import 'package:banco/pages/Login/longin_validador_entrada.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:banco/provider/lista_funcionario.dart';
import 'package:banco/provider/repository_geral.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NovoClienteComConta()),
        ChangeNotifierProvider(create: (_) => ListaFuncionairo()),
        ChangeNotifierProvider(create: (_) => IRepositoryGeral())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Logins(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                builder: (context) => const HomePage(),
              );
            case '/formularioFuncionarios':
              return MaterialPageRoute(
                builder: (context) => const Formulario(),
              );
            case '/formularioConta':
              return MaterialPageRoute(
                builder: (context) => const ContaForm(),
              );
            case '/contacorrente':
              return MaterialPageRoute(
                builder: (context) => ContaCorrenteApresentacao(),
              );
            case "/detalhesContaCorrente":
              return MaterialPageRoute(
                builder: (context) => DetalheContaCorrente(),
              );
            case '/detalhesContaPupanca':
              return MaterialPageRoute(
                builder: (context) => const DetalheContaPupanca(),
              );
            case '/detalhesContaCredito':
              return MaterialPageRoute(
                builder: (context) => const DetalheContaCredito(),
              );

            case "/FuncionarioView":
              return MaterialPageRoute(
                builder: (context) => const Funcionario_view(),
              );

            case "/GerenteView":
              return MaterialPageRoute(builder: (context) => Gerente_view());
          }
          return null;
        },
      ),
    );
  }
}

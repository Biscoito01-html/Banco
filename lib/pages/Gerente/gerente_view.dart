import 'package:banco/components/DrawerGerente/drawer_gerentes.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_contaCorrente.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_credito.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_poupanca.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:banco/provider/lista_funcionario.dart';
import 'package:banco/provider/repository_geral.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: camel_case_types
class Gerente_view extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Gerente_view({Key? key}) : super(key: key);

  @override
  State<Gerente_view> createState() => _Gerente_viewState();
}

// ignore: camel_case_types
class _Gerente_viewState extends State<Gerente_view> {
  @override
  void initState() {
    Provider.of<IRepositoryGeral>(context, listen: false).buscarNoservidor();
    super.initState();
    Provider.of<ListaFuncionairo>(context, listen: false).Buscarnoservidor();
    super.initState();
    Provider.of<NovoClienteComConta>(context, listen: false).pegarNoServidor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout))
          ],
          title: const Text(
            'Gerente',
            style: TextStyle(
              color: Colors.deepOrange,
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Contas Correntes'),
              Tab(text: 'Contas Poupanças'),
              Tab(text: 'Contas Credito'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DetalharContaCorrenteTab(),
            DetalharContaPoupancaTab(),
            DetalharContasCreditosTab(),
          ],
        ),
        drawer: const DrawerGerentes(),
      ),
    );
  }
}

import 'package:banco/components/DrawerGerente/drawer_gerentes.dart';
import 'package:banco/pages/Clientes/detalhar_conta_poupanca.dart';
import 'package:banco/pages/Gerente/detalhamento_cliente.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_contaCorrente.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_credito.dart';
import 'package:banco/pages/Gerente/detalhar_cliente_poupanca.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:banco/provider/lista_funcionario.dart';
import 'package:banco/provider/repository_geral.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
  late TabController _tabController;

  @override
  void initState() {
    Provider.of<IRepositoryGeral>(context, listen: false).buscarNoservidor();
    Provider.of<ListaFuncionairo>(context, listen: false).Buscarnoservidor();
    Provider.of<NovoClienteComConta>(context, listen: false).pegarNoServidor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Exemplo de DefaultTabController'),
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
        ),
      ),
    );
  }
}

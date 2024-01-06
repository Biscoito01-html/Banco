import 'package:banco/components/DrawerGerente/drawer_gerentes.dart';
import 'package:banco/pages/Gerente/detalhamento_cliente.dart';
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
  @override
  void initState() {
    super.initState();
    Provider.of<IRepositoryGeral>(context, listen: false).buscarNoservidor();
    Provider.of<ListaFuncionairo>(context, listen: false).Buscarnoservidor();
  }

  @override
  Widget build(BuildContext context) {
    final valoresContaCorrente =
        Provider.of<IRepositoryGeral>(context, listen: false).contaCorrente;

    final valoresContaPoupanca =
        Provider.of<IRepositoryGeral>(context, listen: false).contaPoupanca;
    final valoresContaCredito =
        Provider.of<IRepositoryGeral>(context, listen: false).contaCredito;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text("Gerente"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Detalhes dos Clientes Cadastrados",
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              "Contas Correntes ",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: valoresContaCorrente.length,
                itemBuilder: (context, index) {
                  final cliente = valoresContaCorrente[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditarContaCliente(
                            id: "${cliente.id}",
                            cpf: "${cliente.cpf}",
                            nome: "${cliente.nome}",
                            telefone: "${cliente.telefone}",
                            email: "${cliente.email}",
                            endereco: "${cliente.endereco}",
                            idade: "${cliente.idade}",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListTile(
                        title: Text("Nome: ${cliente.nome.nome}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail: ${cliente.email}"),
                            Text("Idade: ${cliente.idade}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text("Contas Poupanças",
                style: TextStyle(fontSize: 20, color: Colors.red)),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: valoresContaPoupanca.length,
                itemBuilder: (context, index) {
                  final cliente = valoresContaPoupanca[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditarContaCliente(
                            id: "${cliente.id}",
                            cpf: "${cliente.cpf}",
                            nome: "${cliente.nome}",
                            telefone: "${cliente.telefone}",
                            email: "${cliente.email}",
                            endereco: "${cliente.endereco}",
                            idade: "${cliente.idade}",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListTile(
                        title: Text("Nome: ${cliente.nome.nome}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail: ${cliente.email}"),
                            Text("Idade: ${cliente.idade}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text("Contas Credito",
                style: TextStyle(fontSize: 20, color: Colors.red)),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: valoresContaCredito.length,
                itemBuilder: (context, index) {
                  final cliente = valoresContaCredito[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditarContaCliente(
                            id: "${cliente.id}",
                            cpf: "${cliente.cpf}",
                            nome: "${cliente.nome}",
                            telefone: "${cliente.telefone}",
                            email: "${cliente.email}",
                            endereco: "${cliente.endereco}",
                            idade: "${cliente.idade}",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: ListTile(
                        title: Text("Nome: ${cliente.nome.nome}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("E-mail: ${cliente.email}"),
                            Text("Idade: ${cliente.idade}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text(
              "Apresentação de resultados",
              style: TextStyle(fontSize: 25),
            ),
            const Text(
              "Entrada e saida geral",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  backgroundColor: ThemeData().primaryColor,
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 2,
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 1),
                        const FlSpot(2, 4),
                        const FlSpot(3, 2),
                        const FlSpot(4, 5),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerGerentes(),
    );
  }
}

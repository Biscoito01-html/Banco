import 'package:banco/components/DrawerFuncionario/drawer_funcionarios.dart';
import 'package:banco/components/botao_funcionario.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:banco/provider/lista_funcionario.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Funcionario_view extends StatefulWidget {
  const Funcionario_view({super.key});

  @override
  State<Funcionario_view> createState() => _Funcionario_viewState();
}

class _Funcionario_viewState extends State<Funcionario_view> {
  @override
  void initState() {
    Provider.of<ListaFuncionairo>(context, listen: false).Buscarnoservidor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contasFirebase =
        Provider.of<NovoClienteComConta>(context).todasasContas;
    final provider = Provider.of<ListaFuncionairo>(context).funcionariosAtivos;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.login))
        ],
        title: const Text("Atendimento Funcionario"),
      ),
      drawer: const DrawerFuncionario(),
      body: Column(
        children: [
          const Text(
            "Bem vindo, Fulano",
            style: TextStyle(fontSize: 25),
          ),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              children: [
                CustomButton(
                  icon: Icons.account_box_sharp,
                  label: "Atendimento",
                  onPressed: () {},
                ),
                CustomButton(
                  icon: Icons.real_estate_agent_outlined,
                  label: "Contas",
                  onPressed: () {},
                ),
                CustomButton(
                  icon: Icons.account_box_sharp,
                  label: "Loteria",
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(color: Colors.amber),
          Expanded(
            child: ListView.builder(
              itemCount: provider.length,
              itemBuilder: (context, index) {
                final cliente = provider[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        Text(
                          cliente.nome.toString(),
                        ),
                        Text(
                          cliente.cargo.toString(),
                        ),
                        Text(
                          cliente.telefone.toString(),
                        ),
                        Text(
                          cliente.email.toString(),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: contasFirebase.length,
              itemBuilder: (clienteId, index) {
                final contas = contasFirebase[index];
                final valores = contas.cliente;
                final contasreais = contas.conta;

                return Column(
                  children: [
                    Text(valores.endereco.toString()),
                    Text(valores.nome.toString()),
                    Text(valores.cpf.toString()),
                    Text(valores.telefone.toString()),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

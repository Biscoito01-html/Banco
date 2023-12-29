import 'package:banco/components/button_inicial.dart';
import 'package:banco/components/DrawerClientes/drawer_cliente.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContaCorrenteApresentacao extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  ContaCorrenteApresentacao({Key? key});

  bool valor = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.exit_to_app_rounded),
            ),
          ],
          title: const Text("Conta"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Contas'),
              Tab(text: 'Transferências'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ButtonTelaInicial(
                    button: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/detalhesContaCorrente');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Conta Corrente"),
                          const Text("Saldo"),
                          const Text("R\$ 1.300,00"),
                          valor
                              ? const Text("Cheque-Especial: 0,00")
                              : const Text("Cheque-Especial : R\$ 1.300,00"),
                        ],
                      ),
                    ),
                  ),
                  ButtonTelaInicial(
                    button: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/detalhesContaPupanca');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Conta Poupança"),
                          Text("Saldo"),
                          Text("R\$ 1.300,00"),
                        ],
                      ),
                    ),
                  ),
                  ButtonTelaInicial(
                    button: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/detalhesContaCredito");
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Conta Credito"),
                          Text("Saldo"),
                          Text("R\$ 1.300,00"),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                    children: [],
                  ),
                ],
              ),
            ),
            // Adicione aqui a tela de transferências ou outra aba desejada
            // Exemplo: TelaTransferencias(),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: const [
                  TransferenciaItem(valor: 50.0, destinatario: 'João'),
                  TransferenciaItem(valor: 30.0, destinatario: 'Maria'),
                  TransferenciaItem(valor: 80.0, destinatario: 'Carlos'),
                  // Adicione mais itens de transferência conforme necessário
                ],
              ),
            )
          ],
        ),
        drawer: const DrawerImplementes(),
      ),
    );
  }
}

class TransferenciaItem extends StatelessWidget {
  final double valor;
  final String destinatario;

  const TransferenciaItem(
      {super.key, required this.valor, required this.destinatario});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.arrow_forward),
        title: Text('Transferência para $destinatario'),
        subtitle: Text('Valor: R\$ $valor'),
      ),
    );
  }
}

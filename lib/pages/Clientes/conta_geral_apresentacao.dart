import 'package:banco/components/button_inicial.dart';
import 'package:banco/components/DrawerClientes/drawer_cliente.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContaCorrenteApresentacao extends StatelessWidget {
  ContaCorrenteApresentacao({super.key});

  bool valor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app_rounded),
          ),
        ],
        title: const Text("Conta corrente"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Banco Force",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
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
                        // ignore: dead_code
                        ? const Text("Cheque-Especial: 0,00")
                        : const Text("Cheque-Especial : R\$ 1.300,00")
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
                    Text("R\$ 1.300,00")
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
                    Text("R\$ 1.300,00")
                  ],
                ),
              ),
            ),
            const Row(
              children: [],
            )
          ],
        ),
      ),
      drawer: const DrawerImplementes(),
    );
  }
}

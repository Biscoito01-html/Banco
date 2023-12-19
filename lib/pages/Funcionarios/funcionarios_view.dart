import 'package:banco/components/DrawerFuncionario/drawer_funcionarios.dart';
import 'package:banco/components/botao_funcionario.dart';
import 'package:flutter/material.dart';

class Funcionario_view extends StatelessWidget {
  const Funcionario_view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.login))
        ],
        title: const Text("Atendimento Funcionario"),
      ),
      drawer: const DrawerFuncionario(),
      body: Column(
        children: [
          Text(
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
                CustomButton(
                  icon: Icons.account_box_sharp,
                  label: "Loteria",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

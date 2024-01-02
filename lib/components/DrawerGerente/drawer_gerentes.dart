import 'package:banco/pages/Formularios/formulario_funcionario.dart';
import 'package:flutter/material.dart';

class DrawerGerentes extends StatelessWidget {
  const DrawerGerentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ThemeData().primaryColor),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                ),
                SizedBox(height: 10),
                Text(
                  'Bom dia, Fulano',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.format_indent_increase_outlined),
            title: const Text("Gerenciamento de Contas"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Gerenciamento de Clientes"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.construction_outlined),
            title: const Text("Gerenciamento de Estrutura"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.emoji_people_sharp),
            title: const Text("Gerenciamento Funcionarios"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Formulario()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined),
            title: const Text("Atendimento ao Cliente"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.format_indent_decrease_outlined),
            title: const Text("Atendimento ao Fornecedor"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

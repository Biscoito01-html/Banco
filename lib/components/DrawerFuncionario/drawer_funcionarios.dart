import 'package:flutter/material.dart';

class DrawerFuncionario extends StatelessWidget {
  const DrawerFuncionario({super.key});

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
            title: const Text("Atendimento ao cliente"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Caixa"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.construction_outlined),
            title: const Text("Horas de Trabalho"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// ignore: file_names
import 'package:banco/pages/Gerente/detalhamento_cliente.dart';
import 'package:banco/provider/repository_geral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalharContaCorrenteTab extends StatefulWidget {
  const DetalharContaCorrenteTab({super.key});

  @override
  State<DetalharContaCorrenteTab> createState() =>
      _DetalharContaCorrenteState();
}

class _DetalharContaCorrenteState extends State<DetalharContaCorrenteTab> {
  @override
  Widget build(BuildContext context) {
    final valoresContaCorrente =
        Provider.of<IRepositoryGeral>(context, listen: false).contaCorrente;

    return Column(
      children: [
        const Text(
          "Contas Correntes ",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: valoresContaCorrente.length,
            itemBuilder: (context, index) {
              final cliente = valoresContaCorrente[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ListTile(
                    titleTextStyle: const TextStyle(fontSize: 20),
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(cliente.nome.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-mail: ${cliente.email}"),
                        Text("Idade: ${cliente.idade}"),
                        Text("Telefone: ${cliente.telefone}"),
                      ],
                    ),
                    trailing: Text("${cliente.id}"),
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
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

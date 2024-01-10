import 'package:banco/pages/Gerente/detalhamento_cliente.dart';
import 'package:banco/provider/repository_geral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalharContaPoupancaTab extends StatefulWidget {
  const DetalharContaPoupancaTab({super.key});

  @override
  State<DetalharContaPoupancaTab> createState() =>
      _detalharContaPoupancaState();
}

class _detalharContaPoupancaState extends State<DetalharContaPoupancaTab> {
  @override
  Widget build(BuildContext context) {
    final valoresContaPoupanca =
        Provider.of<IRepositoryGeral>(context, listen: false).contaPoupanca;
    return Column(
      children: [
        const Text("Contas Poupanças",
            style: TextStyle(fontSize: 20, color: Colors.red)),
        Expanded(
          child: ListView.builder(
            itemCount: valoresContaPoupanca.length,
            itemBuilder: (context, index) {
              final cliente = valoresContaPoupanca[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    trailing: Text("dc"),
                    title: Text("Nome: ${cliente.nome.nome}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-mail: ${cliente.email}"),
                        Text("Idade: ${cliente.idade}"),
                        Text("Telefone: ${cliente.telefone}"),
                      ],
                    ),
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

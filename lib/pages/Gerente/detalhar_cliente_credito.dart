import 'package:banco/pages/Gerente/detalhamento_cliente.dart';
import 'package:banco/provider/repository_geral.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalharContasCreditosTab extends StatefulWidget {
  const DetalharContasCreditosTab({super.key});

  @override
  State<DetalharContasCreditosTab> createState() =>
      _DetalharContasCreditosState();
}

class _DetalharContasCreditosState extends State<DetalharContasCreditosTab> {
  @override
  Widget build(BuildContext context) {
    final valoresContaCredito =
        Provider.of<IRepositoryGeral>(context, listen: false).contaCredito;
    return Column(
      children: [
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
      ],
    );
  }
}

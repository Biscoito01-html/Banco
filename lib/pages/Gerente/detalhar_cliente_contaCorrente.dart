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
      ],
    );
  }
}

import 'package:banco/provider/lista_cliente_novo.dart';

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
  void initState() {
    Provider.of<NovoClienteComConta>(context, listen: false).pegarNoServidor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final valoresContaCredito =
    //     Provider.of<IRepositoryGeral>(context, listen: false).contaCredito;

    final contas =
        Provider.of<NovoClienteComConta>(context, listen: false).todasasContas;

    return Column(
      children: [
        const Text("Contas Credito",
            style: TextStyle(fontSize: 20, color: Colors.red)),
        /*Expanded(
          child: ListView.builder(
            itemCount: valoresContaCredito.length,
            itemBuilder: (context, index) {
              final cliente = valoresContaCredito[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text("Nome: ${cliente.nome}"),
                    trailing: const Text('dc'),
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
        ),*/
      ],
    );
  }
}

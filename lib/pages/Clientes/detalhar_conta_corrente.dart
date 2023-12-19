import 'package:banco/provider/lista_cliente_novo.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetalheContaCorrente extends StatelessWidget {
  DetalheContaCorrente({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = Provider.of<NovoClienteComConta>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes da conta corrente"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

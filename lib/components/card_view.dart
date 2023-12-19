import 'package:banco/models/cliente_models.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardView extends StatelessWidget {
  Cliente cliente;

  CardView({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Text("${cliente.nome}"),
          Text("${cliente.endereco}"),
        ],
      ),
    );
  }
}

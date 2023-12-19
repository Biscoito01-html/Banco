import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonTelaInicial extends StatelessWidget {
  ElevatedButton button;

  ButtonTelaInicial({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: const BoxDecoration(),
        width: 570,
        height: 200,
        child: button,
      ),
    );
  }
}

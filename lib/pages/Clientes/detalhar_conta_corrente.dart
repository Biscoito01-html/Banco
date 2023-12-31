import 'package:flutter/material.dart';

class DetalheContaCorrente extends StatelessWidget {
  DetalheContaCorrente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conta Corrente"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Conta Corrente",
                style: TextStyle(fontSize: 35),
              ),
              Text(
                "Saldo",
                style: TextStyle(fontSize: 35, color: Colors.grey),
              ),
              Text(
                "R\$ 1.300,00",
                style: TextStyle(fontSize: 35, color: Colors.blue),
              ),
              Text(
                "Cheque Especial",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "R\$ 1.300,00",
                style: TextStyle(fontSize: 35, color: Colors.green),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Transferência",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Depósito", style: TextStyle(fontSize: 25)),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Pix", style: TextStyle(fontSize: 25)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

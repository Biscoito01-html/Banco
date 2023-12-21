import 'package:banco/pages/Formularios/formulario_conta.dart';
import 'package:banco/provider/lista_cliente_novo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController CPF = TextEditingController();
  TextEditingController senha = TextEditingController();
  final form = GlobalKey<FormState>();
  bool cadastro = false;

  void cadastrar() {}
  @override
  void initState() {
    super.initState();

    Provider.of<NovoClienteComConta>(context, listen: false).pegarNoServidor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Force"),
      ),
      body: Form(
        key: form,
        child: Column(
          children: [
            const Text(
              "Login/Cadastro",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  cadastro
                      ? const ContaForm()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: CPF,
                                decoration: const InputDecoration(
                                  labelText: 'CPF',
                                ),
                              ),
                              TextFormField(
                                controller: senha,
                                obscureText: true,
                                obscuringCharacter: '*',
                                decoration:
                                    const InputDecoration(labelText: 'Senha'),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/contacorrente');
                        },
                        child: cadastro
                            ? const Text("Enviar")
                            : const Text('Entrar'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            cadastro = !cadastro;
                          });
                        },
                        child: cadastro
                            ? const Text('Login')
                            : const Text("Cadastrar-se"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // drawer: const DrawerImplementes(),
    );
  }
}

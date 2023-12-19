import 'package:banco/models/cliente_models.dart';
import 'package:banco/provider/lista_cliente_novo.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContaForm extends StatefulWidget {
  const ContaForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContaFormState createState() => _ContaFormState();
}

class _ContaFormState extends State<ContaForm> {
  TextEditingController cpfController = TextEditingController();
  TextEditingController nomeDoClienteController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  NovoClienteComConta get provider =>
      Provider.of<NovoClienteComConta>(context, listen: false);

  String _tipoContaSelecionada = 'Conta Corrente';

  final form = GlobalKey<FormState>();

  void _criarConta() {
    form.currentState!.save();
    final cliente = Cliente.criarCliente(
        cpf: cpfController.text,
        nome: nomeDoClienteController.text,
        endereco: enderecoController.text,
        idade: idadeController.text,
        email: emailController.text,
        telefone: telefoneController.text);
    switch (_tipoContaSelecionada) {
      case 'Conta Corrente':
        provider.inserirClienteContaCorrente(cliente).catchError((error) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text("Ocorreu um erro"),
                    content: Text(error.toString()),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"))
                    ],
                  ));
        });
        _mostrarMensagemSucesso('Criado com sucesso');

        break;
      case 'Conta Poupança':
        provider.inserirClienteContaPoupanca(cliente);
        _mostrarMensagemSucesso('Criado com sucesso');

        break;
      case 'Conta de Crédito':
        provider.inserirClienteContaCredito(cliente);
        _mostrarMensagemSucesso('Criado com sucesso');

      default:
        'Valor não identificado';
        break;
    }
  }

  void _mostrarMensagemSucesso(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'CPF'),
              controller: cpfController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome do Titular'),
              controller: nomeDoClienteController,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Informe o Endereço'),
              controller: enderecoController,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Informe a sua idade'),
              controller: idadeController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Informe um E-mail'),
              controller: emailController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Telefone'),
              controller: telefoneController,
            ),
            DropdownButton<String>(
              value: _tipoContaSelecionada,
              onChanged: (String? newValue) {
                setState(() {
                  _tipoContaSelecionada = newValue!;
                });
              },
              items: <String>[
                'Conta Corrente',
                'Conta Poupança',
                'Conta de Crédito'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                _criarConta();
              },
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}

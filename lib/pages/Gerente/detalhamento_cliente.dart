import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';
import 'package:banco/models/cliente_models.dart';
import 'package:flutter/material.dart';

class EditarContaCliente extends StatefulWidget {
  final String id;
  final String cpf;
  final String nome;
  final String endereco;
  final String idade;
  final String email;
  final String telefone;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  EditarContaCliente({
    required this.id,
    required this.cpf,
    required this.nome,
    required this.idade,
    required this.endereco,
    required this.email,
    required this.telefone,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EditarContaClienteState createState() => _EditarContaClienteState();
}

class _EditarContaClienteState extends State<EditarContaCliente> {
  late TextEditingController _nomeController;
  late TextEditingController _idadeController;
  late TextEditingController _enderecoController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.nome);
    _idadeController = TextEditingController(text: widget.idade);
    _enderecoController = TextEditingController(text: widget.endereco);
    _emailController = TextEditingController(text: widget.email);
    _telefoneController = TextEditingController(text: widget.telefone);
  }

  // IRepositoryGeral get provider =>
  //  Provider.of<IRepositoryGeral>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _idadeController,
              decoration: const InputDecoration(labelText: 'Idade'),
            ),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _telefoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final clienteAtualizado = Cliente(
                  id: widget.id,
                  cpf: CPF(widget.cpf),
                  nome: Nome(_nomeController.text),
                  idade: Idade(int.parse(_idadeController.text)),
                  endereco: Endereco(_enderecoController.text),
                  email: Email(_emailController.text),
                  telefone: Telefone(_telefoneController.text),
                );

                //  await provider.atualizarContaCorrente(clienteAtualizado);

                // ignore: use_build_context_synchronously
                Navigator.pop(context); // Volte para a página anterior
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

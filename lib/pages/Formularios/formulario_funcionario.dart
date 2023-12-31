import 'package:banco/models/funcionarios_models.dart';
import 'package:banco/provider/lista_funcionario.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController salarioController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Funcionário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              _buildTextFormField('Nome', nomeController, _validateNome),
              _buildTextFormField('Idade', idadeController, _validateIdade),
              _buildTextFormField('CPF', cpfController, _validateCPF),
              _buildTextFormField('Cargo', cargoController, _validateCargo),
              _buildTextFormField(
                  'Salário', salarioController, _validateSalario),
              _buildTextFormField(
                  'Endereço', enderecoController, _validateEndereco),
              _buildTextFormField('E-mail', emailController, _validateEmail),
              _buildTextFormField(
                  'Telefone', telefoneController, _validateTelefone),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _showConfirmationDialog(),
                child: const Text('Cadastrar Funcionário'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, TextEditingController controller,
      String? Function(String?)? validator) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: validator,
      controller: controller,
    );
  }

  String? _validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'O nome não pode estar vazio';
    }
    return null;
  }

  String? _validateIdade(String? value) {
    if (value == null || value.isEmpty) {
      return 'A idade não pode estar vazia';
    }
    if (int.tryParse(value) == null ||
        int.tryParse(value)! < 18 ||
        int.tryParse(value)! > 65) {
      return 'A idade deve estar entre 18 e 65 anos';
    }
    return null;
  }

  String? _validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'O CPF não pode estar vazio';
    }
    if (!validarCPF(value)) {
      return 'CPF inválido';
    }
    return null;
  }

  String? _validateCargo(String? value) {
    if (value == null || value.isEmpty) {
      return 'O cargo não pode estar vazio';
    }
    if (value != 'Supervisor' &&
        value != 'Gerente' &&
        value != 'Gerente de Filial' &&
        value != 'Caixa') {
      return 'Cargo inválido';
    }
    return null;
  }

  String? _validateSalario(String? value) {
    if (value == null || value.isEmpty) {
      return 'O salário não pode estar vazio';
    }
    if (double.tryParse(value) == null || double.tryParse(value)! < 0) {
      return 'O salário não pode ser negativo';
    }
    return null;
  }

  String? _validateEndereco(String? value) {
    if (value == null || value.isEmpty) {
      return 'O endereço não pode estar vazio';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? _validateTelefone(String? value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return 'Telefone inválido';
    }
    return null;
  }

  bool validarCPF(String cpf) {
    final cleanCPF = cpf.replaceAll(RegExp(r'\D'), '');
    return cleanCPF.length == 11;
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Cadastro'),
          content:
              const Text('Tem certeza de que deseja cadastrar o funcionário?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop();
                _criaFuncionario();
              },
            ),
          ],
        );
      },
    );
  }

  void _criaFuncionario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final funcionario = Funcionario.criarFuncionario(
        nome: nomeController.text,
        idade: idadeController.text,
        cpf: cpfController.text,
        cargo: cargoController.text,
        salario: salarioController.text,
        endereco: enderecoController.text,
        email: emailController.text,
        telefone: telefoneController.text,
      );

      Provider.of<ListaFuncionairo>(context, listen: false)
          .insereFuncionario(funcionario);

      _mostrarMensagemSucesso("Cadastrado com sucesso");
    }
  }

  void _mostrarMensagemSucesso(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

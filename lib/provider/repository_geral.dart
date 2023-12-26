import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';
import 'package:banco/models/cliente_association.dart';
import 'package:banco/models/cliente_models.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

import 'package:http/http.dart' as http;

class IRepositoryGeral with ChangeNotifier {
  List<ClienteContaAssociation> contaCorrente = [];
  List<ClienteContaAssociation> contaPoupanca = [];
  List<ClienteContaAssociation> contaCredito = [];
  List<ClienteContaAssociation> todosAsConta = [];
  List<Cliente> cliente = [];

  final pb = PocketBase('http://127.0.0.1:8090');

  void setContaCorrente(Cliente value) async {
    try {
      // Autenticação de administrador
      final authData = await pb.admins.authWithPassword(
        'matheuscard232@gmail.com',
        'Flutter@01',
      );

      // Cabeçalhos com token de autenticação
      final headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${authData.token}', // Certifique-se de ajustar conforme necessário
      };

      // Exemplo de corpo da requisição
      final body = <String, String>{
        "CPF": "${value.cpf}",
        "nome": "${value.nome}",
        "endereco": "${value.endereco}",
        "idade": "${value.idade}",
        "email": "${value.email}",
        "telefone": "${value.telefone}",
      };

      // Criação do registro na coleção 'Funcionarios'
      final record = await pb
          .collection('contaCorrente')
          .create(headers: headers, body: body);

      print('Registro criado com sucesso: ${record.id}');
    } catch (error) {
      print('Erro durante a requisição: $error');
    }
  }

  void BuscarNoservidor() async {
    final authData = await pb.admins.authWithPassword(
      'matheuscard232@gmail.com',
      'Flutter@01',
    );

    // Cabeçalhos com token de autenticação
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${authData.token}', // Certifique-se de ajustar conforme necessário
    };
    final records = await pb.collection('contaCorrente').getFullList(
          sort: '-created',
        );

    for (var record in records) {
      final clientegerado = Cliente(
        cpf: CPF(record.data['CPF'] as String? ?? ''),
        nome: Nome(record.data['nome'] as String? ?? ''),
        endereco: Endereco(record.data['endereco'] as String? ?? ''),
        idade: Idade(record.data['idade'] as int? ?? 25),
        email: Email(record.data['email'] as String? ?? ''),
        telefone: Telefone(record.data['telefone'] as String? ?? ''),
      );
      cliente.add(clientegerado);
    }
    notifyListeners();
  }
}

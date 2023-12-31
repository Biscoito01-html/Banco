import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';
import 'package:banco/models/cliente_models.dart';
import 'package:banco/models/conta_models.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class IRepositoryGeral with ChangeNotifier {
  List<Cliente> contaCorrente = [];
  List<Cliente> contaPoupanca = [];
  List<Cliente> contaCredito = [];
  List<Cliente> todosAsConta = [];
  List<Cliente> cliente = [];

  final pb = PocketBase('http://127.0.0.1:8090');

  Future<void> setContaCorrente(Cliente value) async {
    try {
      // Autenticação de administrador
      final authData = await pb.admins.authWithPassword(
        'matheuscard232@gmail.com',
        'Flutter@01',
      );

      // Cabeçalhos com token de autenticação
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      };

      // Exemplo de corpo da requisição
      final contaCorrente = ContaCorrente.criarContaCorrente(0);
      final body = <String, String>{
        // Remova a linha referente ao ID do cliente para permitir que o banco de dados gere um ID automático
        "CPF": "${value.cpf}",
        "nome": "${value.nome}",
        "endereco": "${value.endereco}",
        "idade": "${value.idade}",
        "email": "${value.email}",
        "telefone": "${value.telefone}",
        "conta": '${contaCorrente.conta.numeroConta}',
        "saldo": '${contaCorrente.saldo}',
      };

      // Criação do registro na coleção 'contaCorrente'
      final record = await pb
          .collection('contaCorrente')
          .create(headers: headers, body: body);

      // Atualize o ID do cliente com o ID gerado pelo banco de dados
      value.id = record.id;

      print('Registro criado com sucesso: ${record.id}');
    } catch (error) {
      print('Erro durante a requisição: $error');
    }
  }

  Future<void> setPoupanca(Cliente value) async {
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
            'Bearer ${authData.token}', // Certifique-se de ajustar conforme você
      };

      final contaPoupanca = ContaPoupanca.criarContaPoupanca(0);
      final record =
          await pb.collection('contaPoupanca').create(headers: headers, body: {
        "cpf": "${value.cpf}",
        "nome": "${value.nome}",
        "endereco": "${value.endereco}",
        "idade": "${value.idade}",
        "email": "${value.email}",
        "telefone": "${value.telefone}",
        "conta": '${contaPoupanca.conta.numeroConta}',
        "saldo": '${contaPoupanca.saldo}',
      });
      print('Registro criado com sucesso: ${record.id}');
    } catch (error) {
      print('Erro durante a requisição: $error');
    }
  }

  Future<void> setCredito(Cliente value) async {
    try {
      // Autenticação de administrador
      final authData = await pb.admins.authWithPassword(
        'matheuscard232@gmail.com',
        'Flutter@01',
      );

      // Cabeçalhos com token de autenticação
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      };
      final contaCredito = ContaCredito.criarContaCredito(0);
      final record =
          await pb.collection('contaCredito').create(headers: headers, body: {
        "cpf": "${value.cpf}",
        "nome": "${value.nome}",
        "endereco": "${value.endereco}",
        "idade": "${value.idade}",
        "email": "${value.email}",
        "telefone": "${value.telefone}",
        "conta": '${contaCredito.conta.numeroConta}',
        "saldo": '${contaCredito.saldo}',
      });
      // ignore: avoid_print
      print('Registro criado com sucesso: ${record.id}');
    } catch (error) {
      // ignore: avoid_print
      print('Erro durante a requisição: $error');
    }
  }
//separa o metodo buscar noservidor em uma função para cada lista

  Future<void> buscarNoservidor() async {
    cliente.clear();
    final authData = await pb.admins.authWithPassword(
      'matheuscard232@gmail.com',
      'Flutter@01',
    );

    // Cabeçalhos com token de autenticação
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.token}',
    };

    final records = await pb.collection('contaCorrente').getFullList(
          sort: '-created',
        );

    for (var record in records) {
      final clientegerado = Cliente(
        id: record.id,
        cpf: CPF(record.data['CPF'] as String? ?? ''),
        nome: Nome(record.data['nome'] as String? ?? ''),
        endereco: Endereco(record.data['endereco'] as String? ?? ''),
        idade: Idade(record.data['idade'] as int? ?? 25),
        email: Email(record.data['email'] as String? ?? ''),
        telefone: Telefone(record.data['telefone'] as String? ?? ''),
      );
      cliente.add(clientegerado);
      contaCorrente.add(clientegerado);
    }

    final records1 = await pb.collection('contaPoupanca').getFullList(
          sort: '-created',
        );
    for (var record in records1) {
      final clientegerado = Cliente(
        id: record.id,
        cpf: CPF(record.data['cpf'] as String? ?? ''),
        nome: Nome(record.data['nome'] as String? ?? ''),
        endereco: Endereco(record.data['endereco'] as String? ?? ''),
        idade: Idade(record.data['idade'] as int? ?? 25),
        email: Email(record.data['email'] as String? ?? ''),
        telefone: Telefone(record.data['telefone'] as String? ?? ''),
      );
      cliente.add(clientegerado);
      contaPoupanca.add(clientegerado);
    }
    final records2 = await pb.collection('contaCredito').getFullList(
          sort: '-created',
        );
    for (var record in records2) {
      final clientegerado = Cliente(
        id: record.id,
        cpf: CPF(record.data['cpf'] as String? ?? ''),
        nome: Nome(record.data['nome'] as String? ?? ''),
        endereco: Endereco(record.data['endereco'] as String? ?? ''),
        idade: Idade(record.data['idade'] as int? ?? 25),
        email: Email(record.data['email'] as String? ?? ''),
        telefone: Telefone(record.data['telefone'] as String? ?? ''),
      );
      cliente.add(clientegerado);
      contaCredito.add(clientegerado);
    }
    notifyListeners();
  }

  Future<void> atualizarContaCorrente(Cliente cliente) async {
    if (cliente.id == null) {
      print("Erro: ID do cliente é nulo. Não é possível atualizar.");
      // Você pode decidir o que fazer aqui, como lançar uma exceção ou retornar sem fazer nada.
      return;
    }
    final body = <String, dynamic>{
      "id": "${cliente.id}",
      "CPF": "${cliente.cpf}",
      "nome": "${cliente.nome}",
      "endereco": "${cliente.endereco}",
      "email": "${cliente.email}",
      "telefone": "${cliente.telefone}",
      "idade": "${cliente.idade}",
      "saldo": 0.0,
    };
    try {
      final record = await pb
          .collection('contaCorrente')
          .update('${cliente.id}', body: body);

      print("Cliente atualizado com sucesso!");
    } catch (e) {
      print("Erro ao atualizar o cliente: $e");
      // Adicione tratamento de erro adicional, se necessário.
    }
  }
}

/*import 'package:banco/models/funcionarios_models.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class ListaFuncionairo with ChangeNotifier {
  List funcionariosAtivos = [];

  final pb = PocketBase('http://127.0.0.1:8090');

  void gerar() async {
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
      final body = <String, dynamic>{
        "nome": "Nome do Funcionário",
        // Adicione outros campos conforme necessário
      };

      // Criação do registro na coleção 'Funcionarios'
      final record = await pb
          .collection('Funcionarios')
          .create(headers: headers, body: body);

      print('Registro criado com sucesso: ${record.id}');
    } catch (error) {
      print('Erro durante a requisição: $error');
    }
  }

  void Buscarnoservidor() async {
    funcionariosAtivos.clear();

    final authData = await pb.admins.authWithPassword(
      'matheuscard232@gmail.com',
      'Flutter@01',
    );

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.token}',
    };

    final records = await pb.collection('Funcionarios').getFullList(
          sort: '-created',
        );

    for (var record in records) {
      final funcionario = (
        nome: record.data['nome'],
        idade: record.data['idade'],
        cpf: record.data['cpf'],
        cargo: record.data['cargo'],
        salario: record.data['salario'],
        endereco: record.data['endereco'],
        email: record.data['email'],
        telefone: record.data['telefone'] as String? ?? "",
      );
      funcionariosAtivos.add(funcionario);
    }

    notifyListeners();
  }

  Future<void> setFuncionario(Funcionario valor) async {
    final authData = await pb.admins.authWithPassword(
      'matheuscard232@gmail.com',
      'Flutter@01',
    );

    // Cabeçalhos com token de autenticação
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.token}',
    };
    final body = <String, String>{
      'nome': "${valor.nome}",
      "idade": "${valor.idade}",
      "cpf": "${valor.cpf}",
      "cargo": "${valor.cargo}",
      "salario": "${valor.salario}",
      "endereco": "${valor.endereco}",
      "email": "${valor.email}",
      "telefone": "${valor.telefone}",
    };

    final record = await pb
        .collection('Funcionarios')
        .create(headers: headers, body: body);
  }
}
*/
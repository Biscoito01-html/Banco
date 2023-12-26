import 'package:banco/models/funcionarios_models.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

class ListaFuncionairo with ChangeNotifier {
  List<Funcionario> funcionariosAtivos = [];

  void insereFuncionario(Funcionario funcionario) {
    funcionariosAtivos.add(funcionario);
    notifyListeners();
  }

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
}

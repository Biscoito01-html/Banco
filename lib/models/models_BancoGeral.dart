import 'package:banco/models/CNPJ-models.dart';

import 'package:banco/models/funcionarios_models.dart';

// ignore: camel_case_types
class Banco_interno {
  CNPJ item;
  List<Funcionario> funcionarios;

  Banco_interno({required this.funcionarios, required this.item});
}

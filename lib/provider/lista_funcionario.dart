import 'package:banco/models/funcionarios_models.dart';
import 'package:flutter/material.dart';

class ListaFuncionairo with ChangeNotifier {
  List<Funcionario> funcionariosAtivos = [];

  void insereFuncionario(Funcionario funcionario) {
    funcionariosAtivos.add(funcionario);
    notifyListeners();
  }
}

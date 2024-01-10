import 'dart:convert';

import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';
import 'package:banco/models/cliente_models.dart';
import 'package:banco/models/conta_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NovoClienteComConta with ChangeNotifier {
  final baseUrl = "https://banco-f9ddd-default-rtdb.firebaseio.com";

  // Chamada para acesso de conta corrente
  List<dynamic> contas = [];

  Future<void> updateConta(ClienteContaAssociation valor) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contas/${valor.id}.json'),
        body: jsonEncode(
          {
            "Nome": valor.cliente.nome,
            "CPF": valor.cliente.cpf,
            "Idade": valor.cliente.idade,
            "Email": valor.cliente.email,
            "Telefone": valor.cliente.telefone,
            "Endereço": valor.cliente.endereco,
            "NumeroConta": valor.conta.conta.numeroConta,
            "Saldo": valor.conta.saldo,
          },
        ),
      );
      if (response.statusCode == 200) {
        final updatedClienteConta = ClienteContaAssociation(
          Cliente(
            cpf: valor.cliente.cpf,
            nome: valor.cliente.nome,
            endereco: valor.cliente.endereco,
            idade: valor.cliente.idade,
            email: valor.cliente.email,
            telefone: valor.cliente.telefone,
          ),
          valor.conta,
          valor.id,
        );

        final index = contas.indexWhere((element) => element.id == valor.id);
        if (index >= 0) {
          contas[index] = updatedClienteConta;
        }
      } else if (response.statusCode >= 300) {
        throw FormatException(
          'Houve um problema na reposta: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw FormatException('Houve um problema na requisição: $error');
    }

    notifyListeners();
  }

  Future<void> inserirClienteContaCorrente(Cliente cliente) async {
    try {
      final ContaCorrente contaCorrente = ContaCorrente.criarContaCorrente(0);

      final response = await http.post(
        Uri.parse('$baseUrl/contas.json'),
        body: jsonEncode(
          {
            "Nome": cliente.nome,
            "CPF": cliente.cpf,
            "Idade": cliente.idade,
            "Email": cliente.email,
            "Telefone": cliente.telefone,
            "Endereço": cliente.endereco,
            "NumeroConta": contaCorrente.conta.numeroConta,
            "Saldo": contaCorrente.saldo,
          },
        ),
      );

      if (response.statusCode == 200) {
        final id = jsonDecode(response.body)['name'];

        final clienteContaAssoc = ClienteContaAssociation(
            Cliente(
              cpf: cliente.cpf,
              nome: cliente.nome,
              endereco: cliente.endereco,
              idade: cliente.idade,
              email: cliente.email,
              telefone: cliente.telefone,
            ),
            contaCorrente,
            id);
        contas.add(
          clienteContaAssoc,
        );
      } else if (response.statusCode >= 300) {
        throw FormatException(
          'Houve um problema na requisição: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw FormatException("Erro durante a requisição: $error");
    }

    notifyListeners();
  }

  // ignore: unused_element
  Future<void> inserirClienteContaPoupanca(Cliente cliente) async {
    try {
      final contaPoupanca = ContaPoupanca.criarContaPoupanca(0);

      final response = await http.post(
        Uri.parse('$baseUrl/contas.json'),
        body: jsonEncode(
          {
            "Nome": cliente.nome,
            "CPF": cliente.cpf,
            "Idade": cliente.idade,
            "Email": cliente.email,
            "Telefone": cliente.telefone,
            "Endereço": cliente.endereco,
            "NumeroConta": contaPoupanca.conta.numeroConta,
            "Saldo": contaPoupanca.saldo
          },
        ),
      );

      if (response.statusCode == 200) {
        final id = jsonDecode(response.body)['name'];
        contas.add(
          ClienteContaAssociation(
              Cliente(
                cpf: cliente.cpf,
                nome: cliente.nome,
                endereco: cliente.endereco,
                idade: cliente.idade,
                email: cliente.email,
                telefone: cliente.telefone,
              ),
              contaPoupanca,
              id),
        );
      } else if (response.statusCode >= 300) {
        throw FormatException(
          'Houve um problema na reposta: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw FormatException('Houve um problema na requisição: $error');
    }

    notifyListeners();
  }

  Future<void> inserirClienteContaCredito(Cliente cliente) async {
    try {
      final contaCredito = ContaCredito.criarContaCredito(0);

      final response = await http.post(
        Uri.parse('$baseUrl/contas.json'),
        body: jsonEncode(
          {
            "Nome": cliente.nome,
            "CPF": cliente.cpf,
            "Idade": cliente.idade,
            "Email": cliente.email,
            "Telefone": cliente.telefone,
            "Endereço": cliente.endereco,
            "NumeroConta": contaCredito.conta.numeroConta,
            "Saldo": contaCredito.saldo
          },
        ),
      );
      if (response.statusCode == 200) {
        final id = jsonDecode(response.body)['name'];
        contas.add(
          ClienteContaAssociation(
              Cliente(
                cpf: cliente.cpf,
                nome: cliente.nome,
                endereco: cliente.endereco,
                idade: cliente.idade,
                email: cliente.email,
                telefone: cliente.telefone,
              ),
              contaCredito,
              id),
        );
      } else if (response.statusCode >= 300) {
        throw FormatException(
            "Houve algum erro na requisição ${response.statusCode} ");
      }
    } catch (error) {
      throw FormatException("Houve um erro na $error");
    }

    notifyListeners();
  }

  List<ClienteContaAssociation> todasasContas = [];

  Future<void> pegarNoServidor() async {
    todasasContas.clear();
    try {
      final valores = await http.get(Uri.parse('$baseUrl/contas.json'));
      final Map<String, dynamic> contasJson = jsonDecode(valores.body);
      if (valores.statusCode == 200) {
        contasJson.forEach((key, value) {
          todasasContas.add(
            ClienteContaAssociation(
                Cliente(
                  cpf: CPF(
                    (value['CPF'] != null && value['CPF']['valor'] != null)
                        ? value['CPF']['valor'].toString()
                        : '',
                  ),
                  nome: Nome(
                    (value['Nome'] != null && value['Nome']['valor'] != null)
                        ? value['Nome']['valor'] as String
                        : 'null',
                  ),
                  endereco: Endereco(
                    (value['Endereço'] != null &&
                            value['Endereço']['valor'] != null)
                        ? value['Endereço']['valor'] as String
                        : 'null',
                  ),
                  idade: Idade(
                    (value['Idade'] != null && value['Idade']['valor'] != null)
                        ? value['Idade']['valor'] as int
                        : 20,
                  ),
                  email: Email(
                    (value['Email'] != null && value['Email']['valor'] != null)
                        ? value['Email']['valor'] as String
                        : '@mail.com',
                  ),
                  telefone: Telefone(
                    (value['Telefone'] != null &&
                            value['Telefone']['valor'] != null)
                        ? value['Telefone']['valor'] as String
                        : '123456789',
                  ),
                ),
                Conta(
                  ContaBancaria(
                    (value['NumeroConta'] is String
                        ? int.parse(value['NumeroConta'])
                        : value['NumeroConta'] is int
                            ? value['NumeroConta']
                            : 0),
                  ),
                  double.parse(value['Saldo'].toString()),
                ),
                // ignore: unnecessary_cast
                key as String),
          );
        });

        notifyListeners();
      }
    } catch (error) {
      throw FormatException("Houve um erro na $error");
    }
  }
}

class ClienteContaAssociation {
  String id;
  Cliente cliente;
  Conta conta;

  ClienteContaAssociation(this.cliente, this.conta, this.id);
}

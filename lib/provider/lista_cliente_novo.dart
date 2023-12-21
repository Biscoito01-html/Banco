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
  List<ClienteContaAssociation> clientesContaCorrente = [];

  Future<void> updateConta(ClienteContaAssociation valor) async {
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/contasCorrentes/${valor.id}.json'),
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

        final index =
            todasAscontas.indexWhere((element) => element.id == valor.id);
        if (index >= 0) {
          todasAscontas[index] = updatedClienteConta;
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
        Uri.parse('$baseUrl/contasCorrentes.json'),
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
        clientesContaCorrente.add(
          clienteContaAssoc,
        );
        insereNalistaGeraldeContas(
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

  List<ClienteContaAssociation> clienteNovaContaPoupanca = [];

  // ignore: unused_element
  Future<void> inserirClienteContaPoupanca(Cliente cliente) async {
    try {
      final contaPoupanca = ContaPoupanca.criarContaPoupanca(0);

      final response = await http.post(
        Uri.parse('$baseUrl/contasPoupanca.json'),
        body: jsonEncode(
          {
            "NomeCliente": cliente.nome,
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
        clienteNovaContaPoupanca.add(
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
        insereNalistaGeraldeContas(
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

  List<ClienteContaAssociation> clienteNovaContaCredito = [];

  Future<void> inserirClienteContaCredito(Cliente cliente) async {
    try {
      final contaCredito = ContaCredito.criarContaCredito(0);

      final response = await http.post(
        Uri.parse('$baseUrl/contasCreditos.json'),
        body: jsonEncode(
          {
            "NomeCliente": cliente.nome,
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
        final id = jsonDecode(response.body);
        clienteNovaContaCredito.add(
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
        insereNalistaGeraldeContas(
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

  List<ClienteContaAssociation> todasAscontas = [];

  Future<void> pegarNoServidor() async {
    todasAscontas.clear();

    final response1 = await http.get(
      Uri.parse('$baseUrl/contasCorrentes.json'),
    );

    Map<String, dynamic> data = jsonDecode(response1.body);

    data.forEach((clienteId, cliente) {
      ClienteContaAssociation clienteContaAssociation = ClienteContaAssociation(
        Cliente(
          id: clienteId,
          cpf: CPF(cliente['CPF']['valor']),
          nome: Nome(cliente['Nome']['valor']),
          endereco: Endereco(cliente['Endereço']['valor']),
          idade: Idade(cliente['Idade']['valor']),
          email: Email(cliente['Email']['valor']),
          telefone: Telefone(cliente['Telefone']['valor']),
        ),
        Conta(
          ContaBancaria(cliente['NumeroConta']),
          cliente['Saldo'],
        ),
        clienteId,
      );

      todasAscontas.add(clienteContaAssociation);
      print(todasAscontas);
    });

    notifyListeners();
  }

  void insereNalistaGeraldeContas(ClienteContaAssociation clienteConta) {
    todasAscontas.add(clienteConta);

    notifyListeners();
  }

  List<ClienteContaAssociation> encontrarClientesPorCPF(String cpf) {
    return todasAscontas
        .where((element) => cpf == element.cliente.cpf.numeroDeCpf)
        .toList();
  }
}

class ClienteContaAssociation {
  String id;
  Cliente cliente;
  Conta conta;

  ClienteContaAssociation(this.cliente, this.conta, this.id);
}

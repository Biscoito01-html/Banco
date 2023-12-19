import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';

import 'package:uuid/uuid.dart';

class Cliente {
  String? id;
  CPF cpf;
  Nome nome;
  Endereco endereco;
  Idade idade;
  Email email;
  Telefone telefone;

  Cliente({
    this.id,
    required this.cpf,
    required this.nome,
    required this.endereco,
    required this.idade,
    required this.email,
    required this.telefone,
  });
  @override
  String toString() {
    return 'Cliente: Nome=$nome, Idade=$idade, CPF=$cpf, Endereço=$endereco, E-mail=$email, Telefone=$telefone';
  }

  factory Cliente.criarCliente({
    required String cpf,
    required String nome,
    required String endereco,
    required String idade,
    required String email,
    required String telefone,
  }) {
    final cpfObj = CPF(cpf);
    final nomeObj = Nome(nome);
    final enderecoObj = Endereco(endereco);
    final idadeObj = Idade(int.tryParse(idade) ?? 0);
    final emailObj = Email(email);
    final telefoneObj = Telefone(telefone);

    return Cliente(
        id: const Uuid().v4(),
        cpf: cpfObj,
        nome: nomeObj,
        endereco: enderecoObj,
        idade: idadeObj,
        email: emailObj,
        telefone: telefoneObj);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome.nome,
      'endereco': endereco,
      'idade': idade,
      'email': email,
      'telefone': telefone,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente.criarCliente(
      cpf: map['CPF'],
      nome: map['nome'],
      endereco: map['endereco'],
      idade: map['idade'],
      email: map['email'],
      telefone: map['telefone'],
    );
  }
}

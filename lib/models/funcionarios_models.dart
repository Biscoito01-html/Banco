import 'package:banco/models/CPF_models.dart';
import 'package:banco/models/INFO_Comum.dart';
import 'package:uuid/uuid.dart';

//aqui fica o dominio
class Funcionario {
  String? id;
  Nome nome;
  Idade idade;
  CPF cpf;
  Cargo cargo;
  Salario salario;
  Endereco endereco;
  Email email;
  Telefone telefone;

  Funcionario(
      {this.id,
      required this.nome,
      required this.idade,
      required this.cpf,
      required this.cargo,
      required this.salario,
      required this.endereco,
      required this.email,
      required this.telefone});

  @override
  String toString() {
    return 'Funcionário: Nome=$nome, Idade=$idade, CPF=$cpf, Cargo=$cargo, Salário=$salario, Endereço=$endereco, E-mail=$email, Telefone=$telefone';
  }

  factory Funcionario.criarFuncionario({
    required String nome,
    required String idade,
    required String cpf,
    required String cargo,
    required String salario,
    required String endereco,
    required String email,
    required String telefone,
  }) {
    final idObjt = Uuid().v4();
    final nomeObj = Nome(nome);
    final idadeObj = Idade(int.tryParse(idade) ?? 0);
    final cpfObj = CPF(cpf);
    final cargoObj = Cargo(cargo);
    final salarioObj = Salario(double.tryParse(salario) ?? 0);
    final enderecoObj = Endereco(endereco);
    final emailObj = Email(email);
    final telefoneObj = Telefone(telefone);

    return Funcionario(
      id: idObjt,
      nome: nomeObj,
      idade: idadeObj,
      cpf: cpfObj,
      cargo: cargoObj,
      salario: salarioObj,
      endereco: enderecoObj,
      email: emailObj,
      telefone: telefoneObj,
    );
  }

  factory Funcionario.fromMap(Map<String, dynamic> map) {
    return Funcionario.criarFuncionario(
        nome: map['nome'],
        idade: map['nome'],
        cpf: map['CPF'],
        cargo: map['nome'],
        salario: map['nome'],
        endereco: map['nome'],
        email: map['nome'],
        telefone: map['nome']);
  }
}

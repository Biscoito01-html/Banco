// ignore: file_names
class Nome {
  String nome;

  Nome(this.nome) {
    if (nome.isEmpty) {
      throw Exception('Nome não pode estar vazio');
    }
  }

  @override
  String toString() {
    return nome;
  }

  Map<String, dynamic> toJson() {
    return {'valor': nome};
  }
}

class Idade {
  int idade;
  Idade(this.idade) {
    if (idade < 18 || idade > 65) {
      throw Exception('Idade deve estar entre 18 e 120 anos');
    }
  }
  @override
  String toString() {
    return "$idade";
  }

  Map<String, dynamic> toJson() {
    return {'valor': idade};
  }
}

class Cargo {
  static const String supervisor = 'Supervisor';
  static const String gerente = 'Gerente';
  static const String gerenteFilial = 'Gerente de Filial';
  static const String caixa = 'Caixa';

  final String cargo;

  Cargo(this.cargo) {
    if (cargo.isEmpty) {
      throw Exception('Cargo não pode estar vazio');
    }

    if (![supervisor, gerente, gerenteFilial, caixa].contains(cargo)) {
      throw Exception('Cargo inválido');
    }
  }

  @override
  String toString() {
    return cargo;
  }

  Map<String, dynamic> toJson() {
    return {'valor': cargo};
  }
}

class Salario {
  double salario;

  Salario(this.salario) {
    if (salario < 0) {
      throw Exception('Salário não pode ser negativo');
    }
  }
  @override
  String toString() {
    return "$salario";
  }

  Map<String, dynamic> toJson() {
    return {'valor': salario};
  }
}

class Endereco {
  String endereco;

  Endereco(this.endereco) {
    if (endereco.isEmpty) {
      throw Exception('Endereço não pode estar vazio');
    }
  }
  @override
  String toString() {
    return endereco;
  }

  Map<String, dynamic> toJson() {
    return {'valor': endereco};
  }
}

class Email {
  String email;

  Email(this.email) {
    if (!email.contains('@')) {
      throw Exception('E-mail inválido');
    }
  }
  @override
  String toString() {
    return email;
  }

  Map<String, dynamic> toJson() {
    return {'valor': email};
  }
}

class Telefone {
  String telefone;

  Telefone(this.telefone) {
    if (telefone.isEmpty || telefone.length < 10) {
      throw Exception('Telefone inválido');
    }
  }
  @override
  String toString() {
    return telefone;
  }

  Map<String, dynamic> toJson() {
    return {'valor': telefone};
  }
}

import 'dart:math';

class ContaBancaria {
  int numeroConta;

  ContaBancaria(this.numeroConta);

  @override
  String toString() {
    return "Número da Conta: $numeroConta";
  }
}

class Conta {
  ContaBancaria conta;
  double saldo;

  Conta(this.conta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    saldo -= valor;
  }

  void transferir(Conta destino, double valor) {
    if (saldo >= valor) {
      sacar(valor);
      destino.depositar(valor);
    } else {}
  }

  @override
  String toString() {
    return "Número da Conta: ${conta.numeroConta}, Saldo: $saldo";
  }

  Map<String, dynamic> toJson() {
    return {'numeroConta': conta.numeroConta, 'conta': conta, 'saldo': saldo};
  }
}

class ContaCorrente extends Conta {
  ContaCorrente(ContaBancaria conta, double saldo) : super(conta, saldo);

  factory ContaCorrente.criarContaCorrente(double saldo) {
    return ContaCorrente(
        ContaBancaria(Geradornumero.gerarNumeroContaCorrente), saldo);
  }
}

class ContaPoupanca extends Conta {
  ContaPoupanca(ContaBancaria conta, double saldo) : super(conta, saldo);

  factory ContaPoupanca.criarContaPoupanca(double saldo) {
    return ContaPoupanca(
        ContaBancaria(Geradornumero.gerarNumeroContaPoupanca), saldo);
  }
}

class ContaCredito extends Conta {
  ContaCredito(ContaBancaria conta, double saldo) : super(conta, saldo);

  factory ContaCredito.criarContaCredito(double saldo) {
    return ContaCredito(
        ContaBancaria(Geradornumero.gerarNumeroContaCredito), saldo);
  }
}

class Geradornumero {
  static int _gerarNumeroContaUnico(int tipoDeConta) {
    final random = Random();

    int numeroAleatorio = random.nextInt(100000);

    if (numeroAleatorio % 2 != 0) {
      numeroAleatorio++;
      if (numeroAleatorio > 99999) {
        numeroAleatorio -= 2;
      }
    }
    int numeroConta = tipoDeConta * 100000 + numeroAleatorio;
    return numeroConta;
  }

  static int get gerarNumeroContaCorrente => _gerarNumeroContaUnico(6);
  static int get gerarNumeroContaPoupanca => _gerarNumeroContaUnico(7);
  static int get gerarNumeroContaCredito => _gerarNumeroContaUnico(8);
}

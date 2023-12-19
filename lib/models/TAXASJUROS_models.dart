// ignore: file_names
class Juros {
  static double taxaDeJuros() {
    return 0.01; // 1% de taxa de juros
  }
}

class Taxas {
  double valor;

  Taxas(this.valor);

  static double taxa() {
    return 0.02; // 2% de taxa
  }

  double calcularTaxa() {
    double taxa = Taxas.taxa();
    double valorTaxa = valor * taxa;

    return valorTaxa;
  }

  void aplicarTaxa() {
    double taxa = calcularTaxa();
    valor += taxa;
  }

  double getValor() {
    return valor;
  }
}

class Impostos {
  double valor;

  Impostos(this.valor);

  static double taxaImposto() {
    return 0.05; // 5% de imposto
  }

  double calcularImposto() {
    double taxa = Impostos.taxaImposto();
    double valorImposto = valor * taxa;

    return valorImposto;
  }

  void aplicarImposto() {
    double imposto = calcularImposto();
    valor += imposto;
  }

  double getValor() {
    return valor;
  }
}

class TaxadeManutencao {
  double valor;
  DateTime ultimaCobranca;

  TaxadeManutencao(this.valor) : ultimaCobranca = DateTime.now();

  static double taxaDeAdmistracao() {
    return 0.01;
  }

  void realizarCobranca() {
    DateTime hoje = DateTime.now();
    if (hoje.difference(ultimaCobranca).inDays >= 30) {
      double taxaAdm = TaxadeManutencao.taxaDeAdmistracao();
      double valorDaTaxaAdm = valor * taxaAdm;

      print('Taxa de administração cobrada: $valorDaTaxaAdm');

      ultimaCobranca = hoje;
    } else {
      print('Ainda não se passaram 30 dias desde a última cobrança.');
    }
  }

  double getValor() {
    return valor;
  }
}

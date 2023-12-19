class CNPJ {
  String? _numeroValido;

  CNPJ(String numero) {
    final cleanCNPJ = numero.replaceAll(RegExp(r'\D'), '');

    if (cleanCNPJ.length != 14 || _digitosSaoIguais(cleanCNPJ)) {
      throw const FormatException('CNPJ inválido');
    }

    final cnpjNumeros = cleanCNPJ.substring(0, 12);
    final cnpjDigitos = cleanCNPJ.substring(12);

    if (!_validarDigitoVerificador(cnpjNumeros, cnpjDigitos[0]) ||
        !_validarDigitoVerificador(
            cnpjNumeros + cnpjDigitos[0], cnpjDigitos[1])) {
      throw const FormatException('CNPJ inválido');
    }

    _numeroValido = cleanCNPJ;
  }

  bool _digitosSaoIguais(String cnpj) {
    return cnpj.split('').every((c) => c == cnpj[0]);
  }

  bool _validarDigitoVerificador(String cnpj, String digito) {
    List<int> multiplicadoresPrimeiroDigito = [
      5,
      4,
      3,
      2,
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2
    ];
    List<int> multiplicadoresSegundoDigito = [
      6,
      5,
      4,
      3,
      2,
      9,
      8,
      7,
      6,
      5,
      4,
      3,
      2
    ];

    int somaPrimeiroDigito = 0;
    int somaSegundoDigito = 0;

    for (int i = 0; i < 12; i++) {
      int digit = int.parse(cnpj[i]);
      somaPrimeiroDigito += digit * multiplicadoresPrimeiroDigito[i];
      somaSegundoDigito += digit * multiplicadoresSegundoDigito[i];
    }

    int digito1 =
        (somaPrimeiroDigito % 11) < 2 ? 0 : 11 - (somaPrimeiroDigito % 11);
    int digito2 =
        (somaSegundoDigito % 11) < 2 ? 0 : 11 - (somaSegundoDigito % 11);

    return digito1 == int.parse(digito) && digito2 == int.parse(digito);
  }

  String? get numeroValido => _numeroValido;
}

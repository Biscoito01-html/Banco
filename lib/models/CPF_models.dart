// ignore: file_names
class CPF {
  String? numeroDeCpf;

  CPF(String numero) {
    if (validarCPF(numero)) {
      numeroDeCpf = numero;
    } else {
      throw const FormatException("CPF inválido");
    }
  }

  String? get numeroValido => numeroDeCpf;

  bool validarCPF(String cpf) {
    final cleanCPF = cpf.replaceAll(RegExp(r'[^\d]'), '');
    if (cleanCPF.length != 11) {
      return false;
    }

    int digit10 = 0;
    int digit11 = 0;
    int weight = 10;

    for (int i = 0; i < 9; i++) {
      digit10 += int.parse(cleanCPF[i]) * weight;
      weight--;
    }

    int remainder = digit10 % 11;
    if (remainder < 2) {
      remainder = 0;
    } else {
      remainder = 11 - remainder;
    }

    if (remainder != int.parse(cleanCPF[9])) {
      return false;
    }

    weight = 11;
    for (int i = 0; i < 10; i++) {
      digit11 += int.parse(cleanCPF[i]) * weight;
      weight--;
    }

    remainder = digit11 % 11;
    if (remainder < 2) {
      remainder = 0;
    } else {
      remainder = 11 - remainder;
    }

    return remainder == int.parse(cleanCPF[10]);
  }

  @override
  String toString() {
    return "$numeroValido";
  }

  Map<String, dynamic> toJson() {
    return {'valor': numeroValido};
  }
}

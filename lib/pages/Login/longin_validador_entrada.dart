import 'package:banco/pages/Formularios/formulario_conta.dart';

import 'package:flutter/material.dart';

class Logins extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Logins({Key? key}) : super(key: key);

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  String? _selectedLoginType;
  bool _valor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _valor
                ? const ContaForm()
                : Column(
                    children: [
                      _buildTextField("Login"),
                      _buildTextField("Senha", isPassword: true),
                      const SizedBox(height: 16.0),
                      _buildLoginTypeDropdown(),
                      const SizedBox(height: 16.0),
                    ],
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _navigateToSelectedScreen();
                  },
                  child: const Text("Entrar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _valor = !_valor;
                    });
                  },
                  child: const Text("Cadastrar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool isPassword = false}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildLoginTypeDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Tipo de Login",
      ),
      items: ["Funcionário", "Cliente", "Gerente"].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedLoginType = value;
        });
      },
      value: _selectedLoginType,
    );
  }

  void _navigateToSelectedScreen() {
    if (_selectedLoginType != null) {
      switch (_selectedLoginType) {
        case "Funcionário":
          Navigator.pushNamed(context, '/FuncionarioView');
          break;
        case "Cliente":
          Navigator.pushNamed(context, '/contacorrente');
          break;
        case "Gerente":
          Navigator.pushNamed(context, '/GerenteView');
          break;
        default:
          // Lógica para tratamento de erro ou comportamento padrão
          break;
      }
    }
  }
}

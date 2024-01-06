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
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade600,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(10)),
                // ignore: sort_child_properties_last
                child: const Text(
                  'Entra na sua conta',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                transform: Matrix4.rotationZ(-8 * 3.14 / 180)..translate(-20.0),
              ),
              const SizedBox(
                height: 10,
              ),
              _valor
                  ? Container(
                      width: double.infinity,
                      height: 550,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const ContaForm(),
                            const SizedBox(height: 16.0),
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
                    )
                  : Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _buildTextField("Login"),
                            _buildTextField("Senha", isPassword: true),
                            const SizedBox(height: 16.0),
                            _buildLoginTypeDropdown(),
                            const SizedBox(height: 16.0),
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
                    ),
            ],
          ),
        )
      ]),
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

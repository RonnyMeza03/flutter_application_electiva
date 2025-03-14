import 'package:flutter/material.dart';
import 'package:flutter_application_electiva/screens/carros_electricos.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _statusMessage = "";

  void _validate() async {
    setState(() {
      _statusMessage = _usernameController.value.text == "admin" && _passwordController.value.text == "admin" 
        ? "Login exitoso" 
        : "usuario o contraseña incorrecta";
    });
    if (_statusMessage == "Login exitoso") {
      await Future.delayed(const Duration(seconds: 1));
      _login();
    }
  }

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoListPage()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _validate,
                child: const Text('Iniciar Sesión'),
              ),
              const SizedBox(height: 20),
              Text(
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold,
                  color: _statusMessage == "Login exitoso" ? Colors.green : Colors.red 
                ),
                _statusMessage,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'No tienes cuenta? Regístrate',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

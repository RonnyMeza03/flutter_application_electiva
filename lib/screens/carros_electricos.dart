import 'package:flutter/material.dart';
import 'package:flutter_application_electiva/screens/FormPage.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Map<String, String>> vehicles = [];

  void _addVehicle(String placa, String conductor, String empresa) {
    setState(() {
      vehicles.add({
        'placa': placa,
        'conductor': conductor,
        'empresa': empresa,
      });
    });
  }

  void _navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(
          onSave: _addVehicle, // Pasamos la función
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Vehículos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: vehicles.map((vehicle) {
          return Card(
            child: ListTile(
              title: Text('Placa: ${vehicle['placa']}'),
              subtitle: Text('Conductor: ${vehicle['conductor']}\nEmpresa: ${vehicle['empresa']}'),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}

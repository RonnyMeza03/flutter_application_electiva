import 'package:flutter/material.dart';
import 'package:flutter_application_electiva/screens/FormPage.dart';
import 'package:flutter_application_electiva/screens/cartDetailPage.dart';

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

  void _editVehicle(String oldPlaca, String newPlaca, String conductor, String empresa) {
    setState(() {
      int index = vehicles.indexWhere((v) => v['placa'] == oldPlaca);
      if (index != -1) {
        vehicles[index] = {'placa': newPlaca, 'conductor': conductor, 'empresa': empresa};
      }
    });
  }

  void _deleteVehicle(String placa) {
    setState(() {
      vehicles.removeWhere((v) => v['placa'] == placa);
    });
  }

  
  void _navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(
          onSave: _addVehicle, 
        ),
      ),
    );
  }

  
  void _navigateToCarDetail(Map<String, String> vehicle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailPage(
          vehicle: vehicle,
          onEdit: _editVehicle,
          onDelete: _deleteVehicle,
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
            child: InkWell(
              onTap: () => _navigateToCarDetail(vehicle), 
              child: ListTile(
                title: Text('Placa: ${vehicle['placa']}'), 
                subtitle: Text('Conductor: ${vehicle['conductor']}\nEmpresa: ${vehicle['empresa']}'), 
              ),
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

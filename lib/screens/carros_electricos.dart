import 'package:flutter/material.dart'; // Importa el paquete de Material Design para usar widgets prediseñados.
import 'package:flutter_application_electiva/screens/FormPage.dart'; // Importa la pantalla del formulario donde se agregarán nuevos vehículos.
import 'package:flutter_application_electiva/screens/cartDetailPage.dart'; // Importa la pantalla donde se mostrarán los detalles de un vehículo.

// Definición de la clase TodoListPage, que representa la pantalla principal con la lista de vehículos.
class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

// Estado de la pantalla TodoListPage.
class _TodoListPageState extends State<TodoListPage> {
  // Lista de vehículos almacenados como mapas con claves de tipo String.
  List<Map<String, String>> vehicles = [];

  // Método para agregar un nuevo vehículo a la lista.
  void _addVehicle(String placa, String conductor, String empresa) {
    setState(() {
      vehicles.add({
        'placa': placa, // Almacena la placa del vehículo.
        'conductor': conductor, // Almacena el nombre del conductor.
        'empresa': empresa, // Almacena la empresa a la que pertenece el vehículo.
      });
    });
  }

  // Método para navegar a la pantalla de formulario para agregar un nuevo vehículo.
  void _navigateToForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(
          onSave: _addVehicle, // Se pasa la función _addVehicle para que el formulario pueda agregar un vehículo.
        ),
      ),
    );
  }

  // Método para navegar a la pantalla de detalles del vehículo seleccionado.
  void _navigateToCarDetail(Map<String, String> vehicle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDetailPage(vehicle: vehicle), // Se pasa el vehículo seleccionado a la pantalla de detalles.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Vehículos')), // Barra de navegación con el título de la página.
      body: ListView(
        padding: const EdgeInsets.all(16), // Aplica un margen alrededor de la lista.
        children: vehicles.map((vehicle) {
          return Card(
            child: InkWell(
              onTap: () => _navigateToCarDetail(vehicle), // Llama a la función de navegación al tocar la tarjeta.
              child: ListTile(
                title: Text('Placa: ${vehicle['placa']}'), // Muestra la placa del vehículo.
                subtitle: Text('Conductor: ${vehicle['conductor']}\nEmpresa: ${vehicle['empresa']}'), // Muestra el conductor y la empresa.
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToForm, // Al presionar, abre la pantalla del formulario para agregar un nuevo vehículo.
        child: const Icon(Icons.add), // Ícono de "más" para agregar un vehículo.
      ),
    );
  }
}

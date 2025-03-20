import 'package:flutter/material.dart';
import 'package:flutter_application_electiva/screens/FormPage.dart';

class CarDetailPage extends StatelessWidget {
  final Map<String, String> vehicle;
  final Function(String, String, String, String) onEdit;
  final Function(String) onDelete;

  const CarDetailPage({
    super.key,
    required this.vehicle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Vehículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Placa: ${vehicle['placa']}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Conductor: ${vehicle['conductor']}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Empresa: ${vehicle['empresa']}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FormPage(
                          onSave: (newPlaca, conductor, empresa) {
                            Navigator.pop(context);
                            onEdit(vehicle['placa']!, newPlaca, conductor, empresa);
                          },
                          vehicle: vehicle, // Pasar los datos actuales para edición
                        ),
                      ),
                    );
                  },
                  child: const Text('Editar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    onDelete(vehicle['placa']!);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

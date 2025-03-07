import 'package:flutter/material.dart';

class CarDetailPage extends StatelessWidget {
  final Map<String, String> vehicle;

  const CarDetailPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del Vehículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Placa: ${vehicle['placa']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Conductor: ${vehicle['conductor']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Empresa: ${vehicle['empresa']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

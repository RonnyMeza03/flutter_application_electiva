// Método para construir una tarjeta de vehículo
  import 'package:flutter/material.dart';

Widget buildVehicleCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor para la imagen del vehículo
            Container(
              width: 50,
              height: 50,
              color: Colors.grey[300],
              child: const Center(child: Text('IMG')),
            ),
            const SizedBox(width: 12),
            // Información del vehículo
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Placa: UKG908', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Conductor: Juan Martin'),
                  Text('Empresa: Sinú'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Function(String, String, String) onSave;
  final Map<String, String>? vehicle;

  const FormPage({super.key, required this.onSave, this.vehicle});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _placaController;
  late TextEditingController _conductorController;
  late TextEditingController _empresaController;

  @override
  void initState() {
    super.initState();
    _placaController = TextEditingController(text: widget.vehicle?['placa'] ?? '');
    _conductorController = TextEditingController(text: widget.vehicle?['conductor'] ?? '');
    _empresaController = TextEditingController(text: widget.vehicle?['empresa'] ?? '');
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(
        _placaController.text,
        _conductorController.text,
        _empresaController.text,
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar/Editar Vehículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _placaController,
                decoration: const InputDecoration(labelText: 'Placa'),
                validator: (value) => value!.isEmpty ? 'Ingrese la placa' : null,
              ),
              TextFormField(
                controller: _conductorController,
                decoration: const InputDecoration(labelText: 'Conductor'),
                validator: (value) => value!.isEmpty ? 'Ingrese el conductor' : null,
              ),
              TextFormField(
                controller: _empresaController,
                decoration: const InputDecoration(labelText: 'Empresa'),
                validator: (value) => value!.isEmpty ? 'Ingrese la empresa' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

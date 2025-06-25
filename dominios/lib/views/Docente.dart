import 'package:flutter/material.dart';

class HomeDocenteView extends StatefulWidget {
  const HomeDocenteView({super.key});

  @override
  State<HomeDocenteView> createState() => _HomeDocenteViewState();
}

class _HomeDocenteViewState extends State<HomeDocenteView> {
  final TextEditingController temaController = TextEditingController();
  final TextEditingController practicaController = TextEditingController();
  final TextEditingController puntoController = TextEditingController();

  String? grupoSeleccionado;
  final List<String> grupos = ["GPS-XA", "GPS-X", "PGA-XA", "H11-YA"];

  void _generarQR() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("QR Generado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Placeholder(fallbackHeight: 100, fallbackWidth: 100),
            const SizedBox(height: 10),
            Text("Clave: DOC123\nMateria: ${temaController.text}\nGrupo: $grupoSeleccionado\nHorario: 10:00 AM"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluacionItem(String titulo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo),
        Row(
          children: List.generate(6, (i) => Radio(value: i, groupValue: null, onChanged: (_) {})),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel Docente')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Seleccionar Grupo"),
              value: grupoSeleccionado,
              items: grupos
                  .map((grupo) => DropdownMenuItem(value: grupo, child: Text(grupo)))
                  .toList(),
              onChanged: (value) => setState(() => grupoSeleccionado = value),
            ),
            TextField(
              controller: temaController,
              decoration: const InputDecoration(labelText: 'Tema'),
            ),
            TextField(
              controller: practicaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'No. práctica'),
            ),
            TextField(
              controller: puntoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'No. punto'),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _generarQR,
                child: const Text("Generar QR"),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Infraestructura", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: const [
                Expanded(child: ListTile(title: Text("Win"), leading: Radio(value: true, groupValue: null, onChanged: null))),
                Expanded(child: ListTile(title: Text("Linux"), leading: Radio(value: false, groupValue: null, onChanged: null))),
              ],
            ),
            const Text("Software utilizado"),
            CheckboxListTile(title: const Text("Java"), value: false, onChanged: (_) {}),
            CheckboxListTile(title: const Text("Autocad"), value: false, onChanged: (_) {}),
            CheckboxListTile(title: const Text("Otros"), value: false, onChanged: (_) {}),
            const SizedBox(height: 20),
            const Text("Evaluación rápida"),
            _buildEvaluacionItem("Computadoras"),
            _buildEvaluacionItem("Software"),
            _buildEvaluacionItem("Internet"),
            _buildEvaluacionItem("Clima"),
            _buildEvaluacionItem("Limpieza"),
            _buildEvaluacionItem("Atención"),
          ],
        ),
      ),
    );
  }
}

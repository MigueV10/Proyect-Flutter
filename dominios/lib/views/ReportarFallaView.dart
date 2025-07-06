import 'package:flutter/material.dart';

class ReportarFallaView extends StatelessWidget {
  const ReportarFallaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1C59),
        title: const Text("Reportar Falla"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text("Describe la falla que tuviste con el servicio de laboratorio"),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: "Escribe aquí...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A1C59),
              ),
              child: const Text("ENVIAR"),
            ),
          ],
        ),
      ),
    );
  }
}

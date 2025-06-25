import 'package:flutter/material.dart';

class ConfirmacionView extends StatelessWidget {
  const ConfirmacionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1C59),
        title: const Text("Confirmación"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text("Tu pase de Lista ha sido registrado"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A1C59),
              ),
              child: const Text("ACEPTAR"),
            ),
          ],
        ),
      ),
    );
  }
}

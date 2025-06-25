import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dominios/providers/usuario_estudiante_provider.dart';
import 'package:dominios/views/ConfirmacionView.dart';

class EscanearQRView extends StatelessWidget {
  const EscanearQRView({super.key});

  @override
  Widget build(BuildContext context) {
    final estudianteProvider = Provider.of<UsuarioEstudianteProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1C59),
        title: const Text("Escanea el código QR"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              height: 180,
              color: Colors.grey[300],
              child: const Center(child: Text("Simulación QR")),
            ),
            const SizedBox(height: 20),
            const Text("Materia: Redes\nGrupo: G2\nHorario: 9-11\nÁrea: Sistemas\nDocente: Juan P.\nSemana: 5\nFecha: 2025-06-20"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                estudianteProvider.registrarAsistencia("QRFAKE-123");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const ConfirmacionView()),
                );
              },
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

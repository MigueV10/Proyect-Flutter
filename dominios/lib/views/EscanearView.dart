import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:dominios/providers/usuario_estudiante_provider.dart';
import 'package:dominios/views/ConfirmacionView.dart';

class EscanearQRView extends StatefulWidget {
  const EscanearQRView({super.key});

  @override
  State<EscanearQRView> createState() => _EscanearQRViewState();
}

class _EscanearQRViewState extends State<EscanearQRView> {
  bool escaneoExitoso = false;
  String? materia, grupo, horario, area, docente, semana, fecha;

  final MobileScannerController _cameraController = MobileScannerController();

  void procesarQR(String rawValue) {
    try {
      final data = jsonDecode(rawValue);

      setState(() {
        escaneoExitoso = true;
        materia = data['materia'];
        grupo = data['grupo'];
        horario = data['horario'];
        area = data['area'];
        docente = data['docente'];
        semana = data['semana'].toString();
        fecha = data['fecha'];
      });

      // Simulamos que se registra asistencia
      Provider.of<UsuarioEstudianteProvider>(context, listen: false)
          .registrarAsistencia(rawValue);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("QR inválido o malformado.")),
      );
    }
  }

  void simularEscaneo() {
    final ejemploQR = jsonEncode({
      "materia": "Procesamiento de Datos Python",
      "grupo": "XA",
      "horario": "11:00 - 13:00",
      "area": "LC4",
      "docente": "M.C. Mario Tiburcio",
      "semana": 3,
      "fecha": "2025-06-10",
    });

    procesarQR(ejemploQR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1C59),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'ESCANEAR EL CÓDIGO QR',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          if (!escaneoExitoso)
            Expanded(
              flex: 3,
              child: MobileScanner(
                controller: _cameraController,
                // allowDuplicates: false,
                onDetect: (capture) {
                  final barcode = capture.barcodes.first;
                  final rawValue = barcode.rawValue;
                  if (rawValue != null) {
                    procesarQR(rawValue);
                  }
                },
              ),
            ),
          if (escaneoExitoso)
           Expanded(
  flex: 3,
  child: Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 350),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFF0A1C59),
            child: Icon(Icons.check_circle_outline, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 15),
          const Text(
            "Datos del Registro",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0A1C59)),
          ),
          const SizedBox(height: 20),
          _infoRow("📚 Materia", materia),
          _infoRow("👥 Grupo", grupo),
          _infoRow("⏰ Horario", horario),
          _infoRow("🖥️ Área", area),
          _infoRow("👨‍🏫 Docente", docente),
          _infoRow("📆 Semana", semana),
          _infoRow("🗓️ Fecha", fecha),
        ],
      ),
    ),
  ),
),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: escaneoExitoso
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const ConfirmacionView()),
                    );
                  }
                : simularEscaneo,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A1C59),
              minimumSize: const Size(200, 50),
            ),
            child: Text(escaneoExitoso ? "CONFIRMAR ASISTENCIA" : "SIMULAR ESCANEO QR"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  Widget _infoRow(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value ?? "",
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
}

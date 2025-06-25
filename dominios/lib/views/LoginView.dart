import 'package:dominios/views/Docente.dart';
import 'package:dominios/views/EstudianteHomeView.dart';
import 'package:flutter/material.dart';
// Aquí también podrías importar otras vistas como docente, admin, etc.

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  String error = '';

  void login() {
    final usuario = usuarioController.text.trim();
    final contrasena = contrasenaController.text;

    // Simulación de credenciales por tipo de usuario
    if (usuario == "estudiante" && contrasena == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const EstudianteHomeView()),
      );
    } else if (usuario == 'docente' && contrasena == '4321') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeDocenteView()),
      );
    } else {
      setState(() {
        error = "Credenciales incorrectas";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          children: [
            const Text(
              "TECNOLOGICO NACIONAL DE MEXICO",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const Text(
              "Instituto Tecnológico de Zacatepec",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/logo.png', // Asegúrate de tener este logo en assets
              height: 100,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuario",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A1C59),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("INGRESAR"),
            ),
          ],
        ),
      ),
    );
  }
}

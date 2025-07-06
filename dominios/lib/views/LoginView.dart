import 'package:dominios/views/Docente.dart';
import 'package:dominios/views/EstudianteHomeView.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xFFEAF0FA),
      body: Center(
        child: Container(
          width: 360,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Instituto Tecnológico de Zacatepec",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/TEC.png', height: 60), // logo izquierdo
                  const SizedBox(width: 20),
                  Image.asset('assets/ITZ.png', height: 60), // logo derecho
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: usuarioController,
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: contrasenaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña de Tecnamex',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: const Icon(Icons.visibility),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (error.isNotEmpty)
                Text(error, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A1C59),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Ingresar"),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _iconLoginButton('assets/outlook.png'),
                  const SizedBox(width: 15),
                  _iconLoginButton('assets/google.png'),
                  const SizedBox(width: 15),
                  _iconLoginButton('assets/phone.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconLoginButton(String assetPath) {
    return InkWell(
      onTap: () {
        // Puedes manejar lógica para login alternativo
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Funcionalidad aún no implementada")),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(assetPath, height: 32),
      ),
    );
  }
}

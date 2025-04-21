import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importación de los providers
import 'package:dominios/providers/gestion_academica_provider.dart';
import 'package:dominios/providers/operador_laboratorio.dart';
import 'package:dominios/providers/reporte_servicio_provider.dart';
import 'package:dominios/providers/usuario_estudiante_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReporteServicioProvider()),
        ChangeNotifierProvider(create: (_) => UsuarioEstudianteProvider()),
        ChangeNotifierProvider(create: (_) => OperadorLaboratorioProvider()),
        ChangeNotifierProvider(create: (_) => GestionAcademicaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sistema de Laboratorios',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Laboratorios'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido al sistema',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final adminProvider = Provider.of<ReporteServicioProvider>(context, listen: false);
                final reporteSatisfaccion = adminProvider.generarReporte("Matemáticas", "G1", "ISC");

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Reporte generado"),
                    content: Text(reporteSatisfaccion.join("\n")),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cerrar"),
                      )
                    ],
                  ),
                );
              },
              child: const Text("Generar reporte (Admin)"),
            ),
          ],
        ),
      ),
    );
  }
}



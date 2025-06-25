import 'package:dominios/views/Docente.dart';
import 'package:dominios/views/EstudianteHomeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:dominios/providers/gestion_academica_provider.dart';
import 'package:dominios/providers/operador_laboratorio.dart';
import 'package:dominios/providers/reporte_servicio_provider.dart';
import 'package:dominios/providers/usuario_estudiante_provider.dart';

// Views
import 'package:dominios/views/LoginView.dart';

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
        ),
       home: const LoginView(),
routes: {
  '/estudiante': (_) => const EstudianteHomeView(),
  '/docente': (_) => const HomeDocenteView(),
      
},
      )
    );
  }
}


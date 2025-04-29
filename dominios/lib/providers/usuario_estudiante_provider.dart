//Subcarpeta PROVIDER para el actor "ESTUDIANTE:PROVIDER"

import 'package:dominios/services/usuario_estudiante_service.dart';
import 'package:flutter/material.dart';

class UsuarioEstudianteProvider with ChangeNotifier {
  final UsuarioEstudianteService _service = UsuarioEstudianteService();

  void registrarAsistencia(String qrData) {
    _service.registrarAsistencia(qrData);
    notifyListeners(); //Solo si queremos reconstruir algo
  }

  void enviarEvaluacion(int id, int calificacion, String comentarios) {
    _service.llenarEvaluacionServicio(id, calificacion, comentarios);
    notifyListeners();
  }
}

//Subcarpeta PROVIDER para el actor "ADMINISTRADOR:PROVIDER"

import 'package:flutter/material.dart';
import 'package:dominios/services/reporte_servicio_service.dart';

class ReporteServicioProvider with ChangeNotifier {
  final ReporteServicioService _service = ReporteServicioService();

  List<String> _reporteSatisfaccion = [];

  List<String> get reporteSatisfaccion => _reporteSatisfaccion;

  List<String> generarReporte(String materia, String grupo, String carrera) {
    _reporteSatisfaccion = _service.generarReporteSatisfaccion(materia, grupo, carrera);
    notifyListeners();
    return _reporteSatisfaccion;
  }

  void certificarSatisfaccionServicio(
    String materia,
    String grupo,
    int calificacion,
  ) {
    _service.certificarSatisfaccionServicio(materia, grupo, calificacion);
    notifyListeners();
  }

  void analizarCalificacionesPorSemestre() {
    _service.analizarCalificacionesPorSemestre();
    notifyListeners();
  }

  void generarReporteAcreditacion(String carrera) {
    _service.generarReporteAcreditacion(carrera);
    notifyListeners();
  }

  void contarPracticasPorCarrera() {
    _service.contarPracticasPorCarrera();
    notifyListeners();
  }

  void listarSoftwarePorAsignatura() {
    _service.listarSoftwarePorAsignatura();
    notifyListeners();
  }

  void evaluarSatisfaccionPorSoftware() {
    _service.evaluarSatisfaccionPorSoftware();
    notifyListeners();
  }

  void generarInformePDF(String grupo, String sala, String periodo) {
    _service.generarInformePDF(grupo, sala, periodo);
    notifyListeners();
  }
}

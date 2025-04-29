//Este dominio le pertenece al actor "DOCENTE:PROVIDER\"

import 'package:dominios/services/gestion_academica_service.dart';
import 'package:dominios/services/reporte_servicio_service.dart';
import 'package:flutter/material.dart';

class GestionAcademicaProvider with ChangeNotifier {
  final GestionAcademicaService _service = GestionAcademicaService();

  String _codigoQrGenerado = '';

  String get codigoQrGenerado => _codigoQrGenerado;

  void generarQR(String grupo, String sala, int fechaHora) {
    final qr = _service.generarCodigoQR(grupo, sala, fechaHora);
    notifyListeners();
    return qr;
  }

  void escanearCodigoQR(String qrData) {
    _service.escanearCodigoQR(qrData);
    notifyListeners();
  }

  void asignarAlumnosAGrupo(int grupoId, List<String> listaAlumnos) {
    _service.asignarAlumnosAGrupo(grupoId, listaAlumnos);
    notifyListeners();
  }

  void configurarHorarioLaboratorio(String sala, String periodo, String grupo) {
    _service.configurarHorarioLaboratorio(sala, periodo, grupo);
    notifyListeners();
  }

  void consultarInformesSatisfaccion() {
    _service.consultarInformesSatisfaccion();
    notifyListeners();
  }
}

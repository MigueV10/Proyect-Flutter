import 'package:flutter/material.dart';
import 'package:dominios/services/operador_laboratorio_service.dart';

class OperadorLaboratorioProvider with ChangeNotifier {
  final OperadorLaboratorioService _service = OperadorLaboratorioService();

  void controlarAcceso(String qrEscaneado) {
    _service.controlarAcceso(qrEscaneado);
    notifyListeners();
  }

  void registrarFallaEquipo(String id, String descripcion) {
    _service.registrarFallaEquipo(id, descripcion);
    notifyListeners();
  }

  void monitorearEquipos(String salaId) {
    _service.monitorearEquipos(salaId);
    notifyListeners();
  }

  void prooverSoporteBasico(String equipoId, String tipoSoporte) {
    _service.proveerSoporteBasico(equipoId, tipoSoporte);
    notifyListeners();
  }
}

import 'package:dominios/dominios/operador_laboratorio.dart';

// class OperadorLaboratorioService {
//   final OperadorLaboratorio _operadorLaboratorio = OperadorLaboratorio();

// void controlarAcceso(String qrEscaneado) {
//     return _operadorLaboratorio.controlarAcceso(qrEscaneado);
//   }

//   void monitorearEquipo(String salaId) {
//     return _operadorLaboratorio.monitorearEquipo(salaId);
//   }

//   void registrarFallaEquipo(String equipoId, String descripcion) {
//     return _operadorLaboratorio.registrarFallaEquipo(equipoId, descripcion);
//   }
// }

class OperadorLaboratorioService {
  final OperadorLaboratorio _operador = OperadorLaboratorio();

  // Control de acceso mediante escaneo de QR
  void controlarAcceso(String qrEscaneado) {
    return _operador.controlarAcceso(qrEscaneado);
  }

  // Monitorear equipos por sala
  void monitorearEquipos(String salaId) {
    return _operador.monitorearEquipo(salaId);
  }

  // Registrar falla en un equipo
  void registrarFallaEquipo(String equipoId, String descripcion) {
    return _operador.registrarFallaEquipo(equipoId, descripcion);
  }

  // Proveer soporte técnico básico
  void proveerSoporteBasico(String equipoId, String tipoSoporte) {
    return _operador.proveerSoporteBasico(equipoId, tipoSoporte);
  }
}

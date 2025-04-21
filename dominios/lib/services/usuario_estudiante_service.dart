import 'package:dominios/dominios/usuario_estudiante.dart';

class UsuarioEstudianteService {
  final UsuarioEstudiante _estudiante = UsuarioEstudiante();

  void llenarEvaluacionServicio(
    int servicioId,
    int calificacion,
    String comentarios,
  ) {
    return _estudiante.llenarEvaluacionServicio(
      servicioId,
      calificacion,
      comentarios,
    );
  }

  void registrarAsistencia(qrEscaneado) {
    return _estudiante.registrarAsistencia(qrEscaneado);
  }
}

import '../dominio/reporte_servicio.dart';

class ReporteServicio {
  final ReporteServicio _reporte = ReporteServicio();
  List<String> generarReporte(String materia, String grupo, String carrera) {
    return _reporte.generarReporte(materia, grupo, carrera);
  }

  //Funciones llamando al dominio
  final ReporteServicio _servicio = ReporteServicio();
  ``
}

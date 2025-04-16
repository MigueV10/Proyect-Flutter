class ReporteServicio {
  //Hacemos la assercion del reporte, el cual mandara a llamar nuestros metodos de la clase "reporte_servicio.dart"
  final ReporteServicio _reporte = ReporteServicio();

  List<String> generarReporte(String materia, String grupo, String carrera) {
    return _reporte.generarReporte(materia, grupo, carrera);
  }

  //Funciones llamando al dominio
  String certificarSatisfaccionServicio(
    String materia,
    String grupo,
    int calificacion,
  ) {
    return _reporte.certificarSatisfaccionServicio(
      materia,
      grupo,
      calificacion,
    );
  }

  Map<int, int> analizarCalificacionesPorSemestre() {
    return _reporte.analizarCalificacionesPorSemestre();
  }

  String generarReporteAcreditacion(String carrera) {
    return _reporte.generarReporteAcreditacion(carrera);
  }

  int contarPracticasPorSemestre() {
    return _reporte.contarPracticasPorSemestre();
  }

  int contarPracticasPorCarrera() {
    return _reporte.contarPracticasPorCarrera();
  }

  List<String> listarSoftwarePorAsignatura() {
    return _reporte.listarSoftwarePorAsignatura();
  }

  Map<String, double> evaluarSatisfaccionPorSoftware() {
    return _reporte.evaluarSatisfaccionPorSoftware();
  }

  String generarInformePDF(String grupo, String sala, String periodo) {
    return _reporte.generarInformePDF(grupo, sala, periodo);
  }
  
}

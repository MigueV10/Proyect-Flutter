//Subcarpeta DOMINIOS para el actor "ADMINISTRADOR:DOMINIO"

class ReporteServicio {
  List<String> generarReporteSatisfaccion(String materia, String grupo, String carrera) {
    return [
      "Materia: $materia",
      "Grupo: $grupo",
      "Carrera: $carrera",
      "Nivel de satisfacción: Alta",
    ];
    }
  }// lógica para generar reporte de satisfacción

  void certificarSatisfaccionServicio(String materia, String grupo, int calificacion) {
    // lógica para certificar satisfacción
  }

  Map<String, int> analizarCalificacionesPorSemestre() {
    // lógica que devuelve conteo de calificaciones 5, 4, 3
    return {'5': 10, '4': 5, '3': 2};
  }

  void generarReporteAcreditacion(String carrera) {
    // lógica para generar reporte de acreditación
  }

  int contarPracticasPorSemestre() {
    // lógica para contar prácticas por semestre
    return 20;
  }

  int contarPracticasPorCarrera() {
    // lógica para contar prácticas por carrera
    return 50;
  }

  List<String> listarSoftwarePorAsignatura() {
    // lógica para listar software
    return ['NetBeans', 'Eclipse', 'SQL', 'DOSBOX', 'C++', 'AUTOCAD'];
  }

  void evaluarSatisfaccionPorSoftware() {
    // lógica para evaluar satisfacción por software
  }

  void generarInformePDF(String grupo, String sala, String periodo) {
    // lógica para generar informe PDF
  }

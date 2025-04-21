import 'package:dominios/dominios/gestion_academica.dart';

class GestionAcademicaService {
  final GestionAcademica _gestionAcademica = GestionAcademica();

/*String*/void generarCodigoQR(String grupo, String sala, int fechaHora) {
    return _gestionAcademica.generarCodigoQR(grupo, sala, fechaHora);
  }

  /*Map<String, dynamic>*/void escanearCodigoQR(String qrData) {
    return _gestionAcademica.escanearCodigoQR(qrData);
  }
  void asignarAlumnosAGrupo(int grupoId, List<String> listaAlumnos) {
    _gestionAcademica.asignarAlumnosAGrupo(grupoId, listaAlumnos);
  }

  void configurarHorarioLaboratorio(String sala, String periodo, String grupo) {
    _gestionAcademica.configurarHorarioLaboratorio(sala, periodo, grupo);
  }

  /*List<String>*/ consultarInformesSatisfaccion() {
    return _gestionAcademica.consultarInformesSatisfaccion();
  }
}
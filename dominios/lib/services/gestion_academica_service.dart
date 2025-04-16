import 'package:dominios/dominio/gestion_academica.dart';

class GestionAcademicaService {
  final GestionAcademica _gestionAcademica = GestionAcademica();

/*String*/void generarCodigoQR(String grupo, String sala, int fechaHora) {
    return _gestionAcademica.generarCodigoQR(grupo, sala, fechaHora);
  }

  /*Map<String, dynamic>*/void escanearCodigoQR(String qrData) {
    return _gestionAcademica.escanearCodigoQR(qrData);
  }
}

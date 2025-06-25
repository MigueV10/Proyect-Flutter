//Subcarpeta DOMINIOS para el actor "Auxiliar de Laboratorio:DOMINIO"

class OperadorLaboratorio {
  void controlarAcceso(String qrEscaneado){
    //logica para controlar el acceso al laboratorio
    
  }
  void monitorearEquipo(String salaId){
    //Logica para monitereo de equipios
  }
  void registrarFallaEquipo(String equipoId,String descripcion){
    //Logica para registrarFallas
  }
  void proveerSoporteBasico(String equipoId, String tipoSoporte){
    //logica para proveer servicio basico
  }
}

// A la hora de registrar una falla, el estudiante o quien reporta la falla debe estar registrado con el codigo
// QR, hacer una regla de negocio para que no cualquier estudiante reporte una falla.
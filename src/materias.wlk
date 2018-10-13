class Materia {
  const property cupo = 0
  const property carrera = null
  const property tipoDeInscripcion = null
  var alumnosInscriptos = []
  var alumnosEnEspera = []
  
  method inscribir(alumno) {
    if (alumno.puedeCursar(self)) {
      if (alumnosInscriptos.size() < cupo) {
        alumnosInscriptos.add(alumno)
      } else {
        alumnosEnEspera.add(alumno)
      }      
    }
  }
  
  method darDeBaja(alumno) {
    alumnosInscriptos.remove(alumno)
    if (!alumnosEnEspera.isEmpty()) {
      alumnosInscriptos.add(alumnosEnEspera.first())
      alumnosEnEspera.remove(alumnosEnEspera.first())
    }
  }
  
  method alumnosInscriptos() = alumnosInscriptos
  
  method alumnosEnEspera() = alumnosEnEspera
  
}

class MateriaAprobada {
  const property nota = 0
  const property materia = null
  const property creditos = 0
}
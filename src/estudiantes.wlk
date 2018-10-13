import materias.*

class Estudiante {

  var carreras = []
  var materiasAprobadas = []

  method aprobarMateria(materia, nota) {
    if (!self.tieneAprobada(materia)) {
      materiasAprobadas.add(new MateriaAprobada(materia = materia, nota = nota))
    }
  }
  
  method creditosAcumulados() = materiasAprobadas.sum({ materia => materia.creditos() })

  method tieneAprobada(materia) = materiasAprobadas.any({ aprobada => aprobada.materia() == materia })

  method esDeUnaCarrera(materia) = carreras.contains(materia.carrera())
  
  method estaInscripto(materia) = materia.alumnosInscriptos().contains(self)
  
  method estaEnEspera(materia) = materia.alumnosEnEspera().contains(self)
  
  method puedeInscribirse(materia) = materia.tipoDeInscripcion().cumpleCondicion(self, materia)

  method puedeCursar(materia) =
    self.esDeUnaCarrera(materia) && !self.tieneAprobada(materia) && !self.estaInscripto(materia) && self.puedeInscribirse(materia)
    
  method listaParaCursar(carrera) {
    if (carreras.contains(carrera)) {
      return carrera.materias().filter({ mat => self.puedeCursar(mat) })
    }
    return null
  }
  
  method listaMateriasInscripto() {
    carreras.forEach({ carrera => carrera.materias().filter({ mat => self.estaInscripto(mat) }) })
  } 
  
  method listaMateriasEnEspera() {
    carreras.forEach({ carrera => carrera.materias().filter({ mat => self.estaEnEspera(mat) }) })
  }
  
}


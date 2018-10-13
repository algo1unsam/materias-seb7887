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

  method puedeCursar(materia) =
    carreras.contains(materia.carrera()) && !self.tieneAprobada(materia) && !materia.alumnosInscriptos().contains(self) && materia.tipoDeInscripcion().esCumplida(self)
  
}


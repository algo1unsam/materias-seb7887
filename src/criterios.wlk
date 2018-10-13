class PorCorrelatividad {

  const property correlatividades = []

  method cumpleCondicion(estudiante, materia) = correlatividades.all({ mat => estudiante.tieneAprobada(mat) })

}

class PorAnio {
  
  method anioAnterior(materia) {
    return materia.carrera().materias().filter({ mat => mat.anio() == (materia.anio() - 1) })
  }
  
  method cumpleCondicion(estudiante, materia) = self.anioAnterior(materia).all({ mat => estudiante.tieneAprobada(mat) })
  
}

class PorCreditos {

  const cantidadDeCreditos = 0

  method cumpleCondicion(estudiante, materia) = estudiante.creditosAcumulados() > cantidadDeCreditos

}

object sinCondicion {

  method cumpleCondicion(estudiante, materia) = true

}


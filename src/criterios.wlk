class PorCorrelatividad {

  const property correlatividades = []

  method esCumplida(estudiante) = correlatividades.all({ materia => estudiante.tieneAprobada(materia) })

}

class PorAnio {
  
  const property anioAnterior = []
  
  method esCumplida(estudiante) = anioAnterior.all({ materia => estudiante.tieneAprobada(materia) })
  
}

class PorCreditos {

  const cantidadDeCreditos = 0

  method esCumplida(estudiante) = estudiante.creditosAcumulados() > cantidadDeCreditos

}

object sinCondicion {

  method esCumplida(estudiante) = true

}


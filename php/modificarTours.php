<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión     			 
     * #	de libros de la capa de acceso a datos 		
     * #==========================================================#
     */

function quitar_tour($conexion,$IdTour) {
	try {
		$stmt=$conexion->prepare('CALL quitar_tour(:IdTour)');
		$stmt->bindParam(':IdTour',$IdTour);
		$stmt->execute();
		return "";
	} catch(PDOException $e) {
		return $e->getMessage();
    }
}

function modificar_tour($conexion, $IdTour, $Nombre, $Tour, $Duracion, $Descripcion, $Coste, $Plazas) {
	try {
		$stmt=$conexion->prepare('CALL modificar_tour(:IdTour, :nombre, :tour, :duracion, :descripcion, :coste, :plazas)');
		$stmt->bindParam(':IdTour',$IdTour);
		$stmt->bindParam(':nombre',$Nombre);
		$stmt->bindParam(':tour',$Tour);
		$stmt->bindParam(':duracion',$Duracion);
		$stmt->bindParam(':descripcion',$Descripcion);
		$stmt->bindParam(':coste',$Coste);
		$stmt->bindParam(':plazas',$Plazas);
		$stmt->execute();
		return "";
	} catch(PDOException $e) {
		return $e->getMessage();
    }
}
    
?>
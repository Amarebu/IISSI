<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function registro_tour($conexion,$nuevoTour) {
	
	try {
		$consulta = "CALL inserta_tour( :idg, :titulo, :tour, :duracion, :descripcion, :coste , :max_plazas, :foto)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':idg',$nuevoTour["IdGuia"]);
		$stmt->bindParam(':titulo',$nuevoTour["Titulo"]);
		$stmt->bindParam(':tour',$nuevoTour["Tour"]);
		$stmt->bindParam(':duracion',$nuevoTour["Duracion"]);
		$stmt->bindParam(':descripcion',$nuevoTour["Descripcion"]);
		$stmt->bindParam(':coste',$nuevoTour["Coste"]);
		$stmt->bindParam(':max_plazas',$nuevoTour["max_plazas"]);
		$stmt->bindParam(':foto',$nuevoTour["Foto"]);
		
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
}
 

  
function consultarTour($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM TOUR WHERE ID_GUIA=:idg AND TITULO=:Titulo";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':idg',$IdGuia);
	$stmt->bindParam(':titutlo',$Titulo);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>
<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function registro_crear_grupo($conexion,$nuevogrupo) {
	$fecha = date('d/m/Y', strtotime($nuevogrupo["Fecha"]));
	
	try {
		$consulta = "CALL inserta_grupo( :idt, :fecha, :hora)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':idt',$nuevogrupo["IdTour"]);
		$stmt->bindParam(':fecha',$fecha);
		$stmt->bindParam(':hora',$nuevogrupo["Hora"]);
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
}
 

  
function consultargrupo($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM INCIDENCIA WHERE ID_TTOUR=:idt AND TEXTO=:texto";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':idt',$IdTour);
	$stmt->bindParam(':texto',$Texto);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>
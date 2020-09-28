<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function registro_incidencia($conexion,$nuevaIncidencia) {
	$fecha = date('d/m/Y', strtotime($nuevaIncidencia["Fecha"]));
	$hora = date('H:m', strtotime($nuevaIncidencia["Hora"]));
	
	try {
		$consulta = "CALL inserta_incidencia( :idg, :texto, :fecha, :hora )";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':idg',$nuevaIncidencia["IdGrupo"]);
		$stmt->bindParam(':texto',$nuevaIncidencia["Texto"]);
		$stmt->bindParam(':fecha',$fecha);
		$stmt->bindParam(':hora',$hora);
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
}
 

  
function consultarIncidencia($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM INCIDENCIA WHERE ID_GRUPO=:idg AND TEXTO=:texto";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':idg',$IdGrupo);
	$stmt->bindParam(':texto',$Texto);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>
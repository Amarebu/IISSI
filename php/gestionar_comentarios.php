<?php
 /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #===========================================================#
     */

function registro_comentario($conexion, $nuevoComentario){
   	  	
	try{
		$consulta= "CALL inserta_comentario(:texto, :idusuario, :idtour)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':texto', $nuevoComentario["texto"]);
		$stmt->bindParam(':idusuario', $nuevoComentario["IdUsuario"]);
	    $stmt->bindParam(':idtour', $nuevoComentario["IdTour"]);
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
	
}

function consultarComentario($conexion,$idcomentario,$texto){
	$consulta= "SELECT COUNT(*) AS TOTAL FROM COMENTARIO WHERE ID_COMENTARIO=:idc AND TEXTO=:comentario";
	$stmt= $conexion->prepare($consulta);
	$stmt->bindParam(':idc', $IdComentario);
	$stmt->bindParam(':texto',$Texto);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>	
	
	
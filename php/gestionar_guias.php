<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function alta_guia($conexion,$nuevoGuia) {

	try {
		$consulta = "CALL inserta_guia( :pass, :nombre, :ape, :dni, :email, :num)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':pass',$nuevoGuia["pass"]);
		$stmt->bindParam(':nombre',$nuevoGuia["nombre"]);
		$stmt->bindParam(':ape',$nuevoGuia["apellidos"]);
		$stmt->bindParam(':dni',$nuevoGuia["dni"]);
		$stmt->bindParam(':email',$nuevoGuia["email"]);
		$stmt->bindParam(':num',$nuevoGuia["num_acreditacion"]);
		
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
}
 

  
function consultarGuia($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM GUIA WHERE EMAIL=:email AND PASS_USER=:pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':email',$email);
	$stmt->bindParam(':pass',$pass);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>
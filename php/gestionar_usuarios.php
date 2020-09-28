<?php
  /*
     * #===========================================================#
     * #	Este fichero contiene las funciones de gestión
     * #	de usuarios de la capa de acceso a datos
     * #==========================================================#
     */

 function alta_usuario($conexion,$nuevoUsuario) {
	$fecha_nacimiento = date('d/m/Y', strtotime($nuevoUsuario["fecha_nacimiento"]));

	try {
		$consulta = "CALL inserta_usuario( :pass, :nombre, :ape, :dni, :telefono, :email, :fechanac)";
		$stmt=$conexion->prepare($consulta);
		$stmt->bindParam(':pass',$nuevoUsuario["pass"]);
		$stmt->bindParam(':nombre',$nuevoUsuario["nombre"]);
		$stmt->bindParam(':ape',$nuevoUsuario["apellidos"]);
		$stmt->bindParam(':dni',$nuevoUsuario["dni"]);
		$stmt->bindParam(':telefono',$nuevoUsuario["telefono"]);
		$stmt->bindParam(':email',$nuevoUsuario["email"]);
		$stmt->bindParam(':fechanac',$fecha_nacimiento);
		
		$stmt->execute();
		
		return true;
	} catch(PDOException $e) {
		return false;
		$e->getMessage();//para visualizar la excepcion
    }
}
 

  
function consultarUsuario($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM USUARIO WHERE EMAIL=:email AND PASS_USER=:pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':email',$email);
	$stmt->bindParam(':pass',$pass);
	$stmt->execute();
	return $stmt->fetchColumn();
}

?>
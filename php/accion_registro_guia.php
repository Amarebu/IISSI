<?php
	session_start();

	require_once("./gestionBD.php");
	require_once("./gestionar_guias.php");
		
	if (isset($_SESSION["formularioguia"])) {
		$nuevoGuia = $_SESSION["formularioguia"];
		$_SESSION["formularioguia"] = null;
	}
	else 
		Header("Location: r_guia.php");	

	$conexion = crearConexionBD();
	$registro = alta_guia($conexion, $nuevoGuia); 
	cerrarConexionBD($conexion);
	if ($registro) {
		$_SESSION["user_email"] = $nuevoGuia['email'];
		$_SESSION["is_guide"] = TRUE;
		addMessage($nuevoGuia["nombre"] . ", gracias por registrarte!.");
		Header("Location: ../index.php");
	} else {
		addError("El usuario ya existe en la base de datos.");
		Header("Location: r_guia.php");
	}

?>


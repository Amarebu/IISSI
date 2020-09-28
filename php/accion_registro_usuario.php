<?php
	session_start();

	require_once("./gestionBD.php");
	require_once("./gestionar_usuarios.php");
		
	if (isset($_SESSION["formulariousuario"])) {
		$nuevoUsuario = $_SESSION["formulariousuario"];
		$_SESSION["formulariousuario"] = null;
	}
	else 
		Header("Location: r_usuario.php");	

	$conexion = crearConexionBD();
	$registro = alta_usuario($conexion, $nuevoUsuario); 
	cerrarConexionBD($conexion);
	if ($registro) {
		$_SESSION["user_email"] = $nuevoUsuario['email'];
		$_SESSION["is_guide"] = FALSE;
		addMessage($nuevoUsuario["nombre"] . ", gracias por registrarte!.");
		Header("Location: ../index.php");
	} else {
		addError("El usuario ya existe en la base de datos.");
		Header("Location: r_usuario.php");
	}

?>

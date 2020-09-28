<?php
	session_start();

	require_once("./gestionBD.php");
	require_once("./gestionar_incidencias.php");
		
	if (isset($_SESSION["formulario"])) {
		$nuevaIncidencia = $_SESSION["formulario"];
		$_SESSION["formulario"] = null;
	}
	else 
		Header("Location: r_incidencias.php");	

	$conexion = crearConexionBD();
	$registro = registro_incidencia($conexion, $nuevaIncidencia); 
	cerrarConexionBD($conexion);
	if ($registro) { 
		addMessage("La incidencia del grupo ha sido registrada.");
		Header("Location: ../index.php");
	} else {
		addError("La incidencia no se ha podido guardar correctamente.");
		Header("Location: r_incidencia.php");
	}

?>


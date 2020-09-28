<?php
	session_start();

	require_once("./gestionBD.php");
	require_once("./gestionar_crear_grupo.php");
		
	if (isset($_SESSION["formulariogrupo"])) {
		$nuevogrupo["IdTour"] = $_POST["IdTour"];
		$nuevogrupo["Hora"] = $_POST["Hora"];
		$nuevogrupo["Fecha"] = $_POST["Fecha"];
		
		$_SESSION["formulariogrupo"] = null;
	}
	else 
		Header("Location: consulta_tour.php");	

	$conexion = crearConexionBD();
	$registro = registro_crear_grupo($conexion, $nuevogrupo); 
	cerrarConexionBD($conexion);
	if ($registro) { 
		addMessage("Grupo creado correctamente.");
	} else {
		addError("El grupo no se ha podido guardar correctamente.");
	}
	Header("Location: consulta_tour.php");

?>

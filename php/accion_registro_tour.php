<?php
	session_start();

	require_once("./gestionBD.php");
	require_once("./gestionar_tour.php");
		
	if (isset($_SESSION["formulariotour"])) {
		$nuevoTour = $_SESSION["formulariotour"];
		$_SESSION["formulariotour"] = null;
	}
	else {
		addError("Se ha intentado acceder a una página no válida. Por favor, entre en la cuenta correcta.");
		Header("Location: r_tour.php");	
	}
	$conexion = crearConexionBD();
	$registro = registro_tour($conexion, $nuevoTour); 
	cerrarConexionBD($conexion);
	if ($registro) { 
		addMessage("El tour ha sido registrado con título: " . $nuevoTour["Titulo"] . ".");
		Header("Location: ../index.php");
	} else {
		addError("El tour no se ha podido guardar correctamente.");
		Header("Location: r_tour.php");
	}

?>

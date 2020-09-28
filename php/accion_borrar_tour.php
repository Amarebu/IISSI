<?php	
	session_start();	
	
	if (isset($_SESSION["tour"])) {
		$tour = $_SESSION["tour"];
		unset($_SESSION["tour"]);
		
		require_once("gestionBD.php");
		require_once("modificarTours.php");
		
		$conexion = crearConexionBD();		
		$excepcion = quitar_tour($conexion,$tour["ID_TOUR"]);
		cerrarConexionBD($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "consulta_tour.php";
			Header("Location: excepcion.php");
		}
		else Header("Location: consulta_tour.php");
	}
	else Header("Location: consulta_tour.php"); // Se ha tratado de acceder directamente a este PHP
?>

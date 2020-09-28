<?php	
	session_start();
	
	if (isset($_REQUEST["ID_TOUR"])){
		$tour["ID_TOUR"] = $_REQUEST["ID_TOUR"];
		$tour["ID_GUIA"] = $_REQUEST["ID_GUIA"];
		$tour["NOMBRE"] = $_REQUEST["NOMBRE"];
		$tour["TOUR"] = $_REQUEST["TOUR"];
		$tour["DURACION"] = $_REQUEST["DURACION"];
		$tour["DESCRIPCION"] = $_REQUEST["DESCRIPCION"];
		$tour["IMPORTE"] = $_REQUEST["IMPORTE"];
		$tour["MAX_PLAZAS"] = $_REQUEST["MAX_PLAZAS"];
		
		$_SESSION["tour"] = $tour;
			
		if (isset($_REQUEST["editar"])) {
			Header("Location: consulta_tour.php"); 
		}
		else if (isset($_REQUEST["grabar"])) {
			Header("Location: accion_modificar_tour.php");
		}
		else if (isset($_REQUEST["borrar"])) {
			Header("Location: accion_borrar_tour.php");
		}
		else if (isset($_REQUEST["nuevo"])) {
			Header("Location: r_crear_grupo.php");
		}
		else if (isset($_REQUEST["comentarios"])) {
			Header("Location: tour_detalle.php" . "?ID_TOUR=" . $tour["ID_TOUR"]);
		}
	}
	else 
		Header("Location: consulta_tour.php");

?>

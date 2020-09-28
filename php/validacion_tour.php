<?php

	session_start();

	require_once("gestionBD.php");

	// Varifica que viene del formulario
	if (isset($_SESSION["formulariotour"])) {
		// Recogemos los datos del formulario
		$nuevoTour["IdGuia"] = $_POST["IdGuia"];
		$nuevoTour["Titulo"] = $_POST["Titulo"];
		$nuevoTour["Tour"] = $_POST["Tour"];
		$nuevoTour["Duracion"] = $_POST["Duracion"];
		$nuevoTour["Descripcion"] = $_POST["Descripcion"];
		$nuevoTour["Coste"] = $_POST["Coste"];
		$nuevoTour["max_plazas"] = $_POST["max_plazas"];
		$nuevoTour['Foto'] = $_POST['Foto'];
							
		$_SESSION["formulariotour"] = $nuevoTour;
		
	}else{ // En caso contrario, vamos al formulario
		addError("Se ha producido un error. Por favor, vuelva a intenarlo.");
	
		Header("Location: r_tour.php"); 
	}

	// Validamos el formulario en servidor
	$conexion = crearConexionBD(); 
//	ValidarDatosIncidencias($conexion, $nuevaIncidencia);
	cerrarConexionBD($conexion);
	
	// Si se han detectado errores
	if (haveErrors()) {
		// Volvemos al formulario
		Header('Location: r_tour.php');
	} else
		// Si todo va bien, vamos a la página de acción (inserción del usuario en la base de datos)
		Header('Location: accion_registro_tour.php');	
  
  /*
 Guardar los datos en la base de datos
   *Ponerlos todos igual aqui antes de guardarlos en la base de datos
   * 

  
function ValidarDatosTour($conexion, $nuevoTour){
	// Validación id			
	if($nuevaIncidencia["IdGrupo"]=="") {
		addError("El IdGrupo no puede estar vacío");
	}
	// Validación hora		
	if($nuevaIncidencia["Hora"]=="") {
		addError("La Hora no puede estar vacía");
	}	
	// Validación fecha
	if($nuevaIncidencia["Fecha"]=="") {
		addError("La Fecha no puede estar vacía");
	}
	
	// Validación del text
	if($nuevaIncidencia["Texto"]==""){ 
		addError("El Texto no puede estar vacío");

	}

}
   
 *  */  
?>
<?php
	session_start();

	require_once("./gestionBD.php");

	// Varifica que viene del formulario
	if (isset($_SESSION["formularioguia"])) {
		// Recogemos los datos del formulario
		$nuevoGuia["nombre"] = $_POST["NOMBRE"];
		$nuevoGuia["apellidos"] = $_POST["APELLIDOS"];
		$nuevoGuia["dni"] = $_POST["DNI"];
		$nuevoGuia["num_acreditacion"]= $_POST["NUM_ACREDITACION"];
		$nuevoGuia["email"]= $_POST["EMAIL"];
		$nuevoGuia["pass"] = $_POST["PASS"];
		$nuevoGuia["confirmpass"] = $_POST["CONFIRMPASS"];
		
		// Guardar la variable local con los datos del formulario en la sesión.
		$_SESSION["formularioguia"] = $nuevoGuia;		
	}
	
	else // En caso contrario, vamos al formulario
		Header("Location: r_guia.php");

	// Validamos el formulario en servidor
	$conexion = crearConexionBD(); 
	ValidarDatosGuia($conexion, $nuevoGuia);
	cerrarConexionBD($conexion);
	
	// Si se han detectado errores
	if (haveErrors()) {
		// Volvemos al formulario
		Header('Location: r_guia.php');
	} else
		// Si todo va bien, vamos a la página de acción (inserción del usuario en la base de datos)
		Header('Location: accion_registro_guia.php');

///////////////////////////////////////////////////////////
// Validación en servidor del formulario de alta de usuario
///////////////////////////////////////////////////////////
function ValidarDatosGuia($conexion, $nuevoGuia){
	// Validación nombre			
	if($nuevoGuia["nombre"]=="") 
		addError("El nombre no puede estar vacío");
	
	// Validación apellido			
	if($nuevoGuia["apellidos"]=="") 
		addError("Los apellidos no pueden estar vacíos");
		
	// Validación dni
	if($nuevoGuia["dni"]=="") 
		addError("El dni no puede estar vacío");
	else if(!preg_match("/^[0-9]{8}[A-Z]$/", $nuevoGuia["dni"])){
		addError("El dni debe contener 8 números y una letra mayúscula: " . $nuevoGuia["dni"]. "");
	}
	
	// Validación del email
	if($nuevoGuia["email"]==""){ 
		addError("El email no puede estar vacío");
	}else if(!filter_var($nuevoGuia["email"], FILTER_VALIDATE_EMAIL)){
		addError("El email es incorrecto: " . $nuevoGuia["email"]. "");
	}
	
	// Validación numero de acreditación
	if($nuevoGuia["num_acreditacion"]=="") 
		addError("El número de acreditación no puede estar vacío");

	
	// Validación de la contraseña
	if(!isset($nuevoGuia["pass"]) || strlen($nuevoGuia["pass"])<6){
		addError("Contraseña no válida: debe tener al menos 6 caracteres");
	}else if(!preg_match("/[a-z]+/", $nuevoGuia["pass"]) || 
		!preg_match("/[a-zA-Z]+/", $nuevoGuia["pass"]) || !preg_match("/[0-9]+/", $nuevoGuia["pass"])){
		addError("Contraseña no válida: debe contener letras y dígitos");
	}else if($nuevoGuia["pass"] != $nuevoGuia["confirmpass"]){
		addError("La confirmación de contraseña no coincide con la contraseña");
	}
}
	
?>

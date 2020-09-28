<?php
	session_start();

	require_once("./gestionBD.php");

	// Varifica que viene del formulario
	if (isset($_SESSION["formulariousuario"])) {
		// Recogemos los datos del formulario
		$nuevoUsuario["nombre"] = $_POST["NOMBRE"];
		$nuevoUsuario["apellidos"] = $_POST["APELLIDOS"];
		$nuevoUsuario["dni"] = $_POST["DNI"];
		$nuevoUsuario["telefono"]= $_POST["TELEFONO"];
		$nuevoUsuario["email"]= $_POST["EMAIL"];
		$nuevoUsuario["fecha_nacimiento"]= $_POST["FECHA_NACIMIENTO"];
		$nuevoUsuario["pass"] = $_POST["PASS"];
		$nuevoUsuario["confirmpass"] = $_POST["CONFIRMPASS"];
		
	
		
		// Guardar la variable local con los datos del formulario en la sesión.
		$_SESSION["formulariousuario"] = $nuevoUsuario;		
	}
	
	else // En caso contrario, vamos al formulario
		Header("Location: r_usuario.php");

	// Validamos el formulario en servidor
	$conexion = crearConexionBD(); 
	ValidarDatosUsuario($conexion, $nuevoUsuario);
	cerrarConexionBD($conexion);
	
	// Si se han detectado errores
	if (haveErrors()) {
		// Volvemos al formulario
		Header('Location: r_usuario.php');
	} else
		// Si todo va bien, vamos a la página de acción (inserción del usuario en la base de datos)
		Header('Location: accion_registro_usuario.php');

///////////////////////////////////////////////////////////
// Validación en servidor del formulario de alta de usuario
///////////////////////////////////////////////////////////
function ValidarDatosUsuario($conexion, $nuevoUsuario){

	// Validación nombre			
	if($nuevoUsuario["nombre"]=="") {
		addError("El nombre no puede estar vacío");
	}
	
	// Validación apellido			
	if($nuevoUsuario["apellidos"]=="") {
		addError("Los apellidos no pueden estar vacíos");
	}
		
	// Validación dni
	if($nuevoUsuario["dni"]=="") 
		addError("El dni no puede estar vacío");
	else if(!preg_match("/^[0-9]{8}[A-Z]$/", $nuevoUsuario["dni"])){
		addError("El dni debe contener 8 números y una letra mayúscula: " . $nuevoUsuario["dni"]. "");
	}

	// Validación telefono
	if($nuevoUsuario["telefono"]=="") {
		addError("El número de acreditación no puede estar vacío");
	} else if(!preg_match("/[0-9]{9}$/", $nuevoUsuario["telefono"])) {
		addError("El numero de telefono debe acabar con 9 dígitos " . $nuevoUsuario["telefono"]. "");
	}
	
	// Validación del email
	if($nuevoUsuario["email"]=="") { 
		addError("El email no puede estar vacío");
	} else if(!filter_var($nuevoUsuario["email"], FILTER_VALIDATE_EMAIL)) {
		addError("El email es incorrecto: " . $nuevoUsuario["email"]. "");
	}
	
	
	// Validación de la fecha de nacimiento
	if($nuevoUsuario["fecha_nacimiento"]=="") { 
		addError("La fecha de nacimiento no puede estar vacía");	
	}


	
	// Validación de la contraseña
	if(!isset($nuevoUsuario["pass"]) || strlen($nuevoUsuario["pass"])<6) {
		addError("Contraseña no válida: debe tener al menos 6 caracteres");
	} else if(!preg_match("/[a-z]+/", $nuevoUsuario["pass"]) || 
		!preg_match("/[a-zA-Z]+/", $nuevoUsuario["pass"]) || !preg_match("/[0-9]+/", $nuevoUsuario["pass"])) {
		addError("Contraseña no válida: debe contener letras y dígitos");
	} else if($nuevoUsuario["pass"] != $nuevoUsuario["confirmpass"]) {
		addError("La confirmación de contraseña no coincide con la contraseña");
	}
}
	
?>

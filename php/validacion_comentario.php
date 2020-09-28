<?php
	session_start();
	
	require_once("gestionBD.php");
	
	//Verifica que viene del formulario
	if(isset($_SESSION["formulariocomentario"])){
		$nuevoComentario["IdUsuario"]= $_POST["IdUsuario"];
		$nuevoComentario["IdTour"] = $_POST["IdTour"];
		$nuevoComentario["texto"] = $_POST["texto"];
		
		$_SESSION["formulariocomentario"]=$nuevoComentario;
		
	}
	else // En caso contrario, vamos al formulario
		Header("Location: r_comentario.php");
		
	// Validamos el formulario en servidor
	$conexion = crearConexionBD(); 
	validarComentario($conexion, $nuevoComentario);
	cerrarConexionBD($conexion);
	
	//Si se han detectado errores volvemos al form, sino a la pag de acción
	if (haveErrors()) {
		Header('Location: r_comentario.php');
	} else
		// Si todo va bien, vamos a la página de acción (inserción del usuario en la base de datos)
		Header('Location: accion_comentario.php');

///////////////////////////////////////////////////////////////
// Validación en servidor del formulario de alta de comentario
//////////////////////////////////////////////////////////////

function validarComentario($conexion, $nuevoComentario){
		
		//Validacion comentario
		if($nuevoComentario["texto"]==""){
			addError("El comentario no puede estar vacío");
		}else if(strlen($nuevoComentario["Texto"]>300)){
			addError("Tu comentario tiene que tener un máximo de 300 caracteres");
		}
	}

?>
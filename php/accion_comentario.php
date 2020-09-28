<?php
	session_start();

	require_once("gestionBD.php");
	require_once("gestionar_comentarios.php");
		
	if (isset($_SESSION["formulariocomentario"])) {
		$nuevoComentario = $_SESSION["formulariocomentario"];
		$_SESSION["formulariocomentario"] = null;
	}
	else 
		Header("Location: r_comentario.php");	

	$conexion = crearConexionBD();
	$registro = registro_comentario($conexion, $nuevoComentario);
	cerrarConexionBD($conexion);
	if ($registro) { 
		addMessage("Muchas gracias por escribir un comentario del tour realizado.");
	} else {
		addError("El comentario no se ha podido enviar, ya ha comentado ese tour.");
	}
	Header("Location: consulta_pago.php");

?>

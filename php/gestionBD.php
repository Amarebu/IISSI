<?php

function crearConexionBD()
{
	$host="oci:dbname=localhost/XE;charset=UTF8";
	$usuario="TOURIST";
	$password="TOURIST";

	try{
		$conexion=new PDO($host,$usuario,$password,array(PDO::ATTR_PERSISTENT => true));

    	$conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		return $conexion;
	}catch(PDOException $e){
		$_SESSION['excepcion'] = $e->GetMessage();
		header("Location: excepcion.php");
	}
}

function cerrarConexionBD($conexion){
	$conexion=null;
}

function addError($error){
	$errores = null;
	if (isset($_SESSION["errores"])) {
		$errores = $_SESSION["errores"];
	} else {
		$errores = array();
	}
	$errores[] = $error;
	$_SESSION["errores"] = $errores;
}

function haveErrors(){
	return isset($_SESSION["errores"]);
}

function addMessage($mensaje){
	$mensajes = null;
	if (isset($_SESSION["mensajes"])) {
		$mensajes = $_SESSION["mensajes"];
	} else {
		$mensajes = array();
	}
	$mensajes[] = $mensaje;
	$_SESSION["mensajes"] = $mensajes;
}
?>

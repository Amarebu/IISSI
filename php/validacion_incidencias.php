<?php

session_start();

require_once("gestionBD.php");

$idGrupo = null;
$texto = null;
if (isset($_REQUEST["IdGrupo"]) && isset($_REQUEST["Texto"])){
	$idGrupo = $_REQUEST["IdGrupo"];
	$texto = $_REQUEST["Texto"];
}

if (!isset($idGrupo) ||!isset($texto)) {
	addError("Formulario de incidencia inválido.");
	Header("Location: r_incidencias.php");
}

$conexion = crearConexionBD(); 

$query_grupo = null;
try {
	$stmt=$conexion->prepare("SELECT FECHA, HORA FROM GRUPO WHERE ID_GRUPO = :grupo");
	$stmt->bindParam(':grupo', $idGrupo);
	$stmt->execute();
	$query_grupo = $stmt->fetch();
} catch(PDOException $e) {
	return $e->getMessage();
}

if (!$query_grupo) {
	addError("Parece que hubo un problema identificando el grupo, inténtelo de nuevo.");
	Header("Location: r_incidencias.php");
}

try {
	$stmt=$conexion->prepare("CALL inserta_incidencia(:grupo, :texto, to_date(:fecha,'DD/MM/RR'), :hora)");
	$stmt->bindParam(':grupo', $idGrupo);
	$stmt->bindParam(':texto', $texto);
	$stmt->bindParam(':fecha', $query_grupo["FECHA"]);
	$stmt->bindParam(':hora', $query_grupo["HORA"]);
	$stmt->execute();
} catch(PDOException $e) {
	return $e->getMessage();
}

cerrarConexionBD($conexion);

addMessage("Incidencia registrada con exito.");
Header("Location: r_incidencias.php");

?>
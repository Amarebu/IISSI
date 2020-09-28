<?php

session_start();

require_once ("gestionBD.php");

$conexion = crearConexionBD();


$query_grupos = null;
try {
	$stmt=$conexion->prepare("SELECT * FROM TOUR NATURAL JOIN GRUPO WHERE ID_GUIA = (SELECT ID_GUIA FROM GUIA WHERE EMAIL = :mail) AND FECHA < CURRENT_DATE AND FECHA > (CURRENT_DATE - 14)");
	$stmt->bindParam(':mail', $_SESSION["user_email"]);
	$stmt->execute();
	$query_grupos = $stmt;
} catch(PDOException $e) {
	return $e->getMessage();
}

$hora_seleccionada = null;

?>

<!DOCTYPE html>
<html lang="es">
<head>
		<meta charset = "UTF-8">
		<title>TL: Registro de incidencias</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
</head>

<?php
	include_once("../html/cabecera.php");
?>
<body>
	<div>
		<h1> Registro de Incidencias</h1>
	</div>

	<div class="col-1"></div>
	<div class="col-8">
		<p class="col-10"><i>Todos los campos son obligatorios</i></p>

		<fieldset class="col-10">
		<legend>
			Incidencias
		</legend>

		<form action ="./validacion_incidencias.php" class="col-10" method="POST" id="r_indicencias">
			<label class="col-2">Grupo: </label>
			<select name="IdGrupo" class="col-8" required>
<?php
			foreach($query_grupos as $grupo) {
				$nombre_tour = $grupo["NOMBRE"];
				$fecha = $grupo["FECHA"];
				$hora = $grupo["HORA"];
				$idgrupo = $grupo["ID_GRUPO"];
				echo $nombre_tour;
?>
				<option value="<?php echo $idgrupo; ?>"><?php echo "Tour: " . $nombre_tour . " [" . $fecha . " " . $hora . "h]"; ?></option>
<?php
			}
?>
			</select>

			<div class="col-10"></div>
			<label class="col-2">Texto: </label>
			<input type="text" class="col-8" name="Texto" maxlength="400" required/>
			<div class="col-10"></div>
			
			<div class="col-10"></div>
			<div class="col-3"></div>
			<input type="submit" class="col-4" name="Enviar" value="submit"/>
			<div class="col-3"></div>
		</form>
		</fieldset>
	</div>
	<div class="col-1"></div>

<?php
	include_once("../html/pie.html");
?>
		
</body>
</html>

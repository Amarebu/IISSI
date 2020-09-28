<?php 
	session_start();
	require_once("./gestionBD.php");	
	$tour = $_SESSION["tour"];
	$_SESSION["tour"] = null;
	if (!isset($_SESSION["formulariogrupo"])) {
		$formulariogrupo['IdGrupo'] = "";
		$formulariogrupo['IdTour'] = "";
		$formulariogrupo['Fecha'] = "";
		$formulariogrupo["Hora"] = "";
		
		$_SESSION["formulariogrupo"] = $formulariogrupo;
	}
	else
		$formulariogrupo = $_SESSION["formulariogrupo"];
	
	$conexion = crearConexionBD();
?>
<!DOCTYPE html>
<html lang="es">
<head>
		<meta charset = "UTF-8">
		<title>TL: Crear grupo</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
</head>

<?php
	include_once("../html/cabecera.php");
?>
<body>
	<div>
		<h1> Crear nuevo grupo del tour: <?php echo $tour["NOMBRE"] ?></h1>
	</div>

	<div class="col-2"></div>
	<div class="col-6">
		<p class="col-10"></p>

		<fieldset class="col-10 trect" >


		<form action ="./accion_crear_grupo.php" class="col-10" method="POST" id="r_crear_grupo">
			<input type="hidden" class="col-8" name="IdTour" maxlength="40" value="<?php echo $tour["ID_TOUR"]  ?>" />
			<div class="col-10"></div>
			<label class="col-2">Hora: </label>
			<input type="number" class="col-8" name="Hora" max="24" min="0" required/>
			<div class="col-10"></div>
			<label class="col-2">Fecha: </label>
			<input type="date" class="col-8" name="Fecha" min= "<?php echo date('Y-m-d');?>"  required/>
			<div class="col-10"></div>
			
			<div class="col-10"></div>
			<div class="col-3"></div>
			<input type="submit" class="col-4" name="Enviar" value="submit"/>
			<div class="col-3"></div>
		</form>
		</fieldset>
	</div>
	<div class="col-2"></div>

<?php
	include_once("../html/pie.html");
?>
		
</body>
</html>

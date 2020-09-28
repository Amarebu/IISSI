<?php
	session_start();
	require_once("gestionBD.php");

	if (!isset($_SESSION["user_email"]) || !isset($_SESSION["is_guide"]) ||$_SESSION["is_guide"] === FALSE) {
		addError("Se ha intentado acceder a una página no válida. Por favor, entre en la cuenta correcta.");
		Header("Location: logout.php");
	}
	$conexion = crearConexionBD();
	$stmt = $conexion->prepare("SELECT * FROM GUIA WHERE EMAIL=:mail");
	$stmt->bindParam(':mail', $_SESSION["user_email"]);
	$stmt->execute();
	$fila = $stmt->fetch();
	
	$nombre="";
	$apellidos="";
	$dni="";
	$acreditacion="";

	if ($fila) {
		$nombre=$fila["NOMBRE"];
		$apellidos=$fila["APELLIDO"];
		$dni=$fila["DNI"];
		$acreditacion=$fila["NUM_ACREDITACION"];
	} else {
		addError("Error al obtener datos del usuario.");
	}

	cerrarConexionBD($conexion);


	if(array_key_exists('incidencia', $_POST)) { 
		Header("Location: r_incidencias.php");
	} 
	else if(array_key_exists('proptour', $_POST)) { 
		Header("Location: r_tour.php");
	}
?> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Perfil guia</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>

	<div>
		<h1> Perfil de Guía</h1>
	</div>

	<div class="col-2"></div>
	<div class="col-6">

		<div class="col-10">
		<label class="col-3">Nombre: </label>
		<input class="col-7" type="text" value="<?php echo $nombre; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">Apellidos: </label>
		<input class="col-7" type="text" value="<?php echo $apellidos; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">DNI: </label>
		<input class="col-7" type="text" value="<?php echo $dni; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">Email: </label>
		<input class="col-7" type="text" value="<?php echo $_SESSION["user_email"]; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">Nº Acreditación: </label>
		<input class="col-7" type="text" value="<?php echo $acreditacion; ?>" readonly>
		</div>
		<form method="post" class="col-10">
			<button type="submit" id="incidencia" name="incidencia" class="col-4">Incidencias</button>
			<div class="col-2"></div>
			<button type="submit" id="proptour" name="proptour" class="col-4">Proponer un Tour</button>
		</form>
	</div>
	<div class="col-2"></div>

<?php
	include_once("../html/pie.html");
?>
	</body>
</html>
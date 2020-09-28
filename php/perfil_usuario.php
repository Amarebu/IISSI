<?php
	session_start();
	require_once("gestionBD.php");

	if (!isset($_SESSION["user_email"]) || !isset($_SESSION["is_guide"]) ||$_SESSION["is_guide"] === TRUE) {
		addError("Se ha intentado acceder a una página no válida. Por favor, entre en la cuenta correcta.");
		Header("Location: login.php");
	}

	$conexion = crearConexionBD();
	$stmt = $conexion->prepare("SELECT * FROM USUARIO WHERE EMAIL=:mail");
	$stmt->bindParam(':mail', $_SESSION["user_email"]);
	$stmt->execute();
	$fila = $stmt->fetch();
	cerrarConexionBD($conexion);
	
	$nombre="";
	$apellidos="";
	$dni="";
	$telefono="";
	$fecha_nac="";

	if ($fila) {
		$nombre=$fila["NOMBRE"];
		$apellidos=$fila["APELLIDOS"];
		$dni=$fila["DNI"];
		$telefono=$fila["TELEFONO"];
		$fecha_nac=$fila["FECHA_NAC"];
	} else {
		addError("Error al obtener datos del usuario.");
		Header("Location: ./login.php");
	}


	if(array_key_exists('historial', $_POST)) { 
		Header("Location: ./consulta_pago.php");
	}
?> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Perfil usuario</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>

	<div>
		<h1> Perfil de Usuario</h1>
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
		<label class="col-3">Teléfono: </label>
		<input class="col-7" type="text" value="<?php echo $telefono; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">Email: </label>
		<input class="col-7" type="text" value="<?php echo $_SESSION["user_email"]; ?>" readonly>
		</div>
		<div class="col-10">
		<label class="col-3">Fecha nacimiento: </label>
		<input class="col-7" type="text" value="<?php echo $fecha_nac; ?>" readonly>
		</div>
		<form method="post" class="col-10">
			<div class="col-3"></div>
			<button type="submit" id="historial" name="historial" class="col-4">Historial</button>
			<div class="col-3"></div>
		</form>
	</div>
	<div class="col-2"></div>

<?php
	include_once("../html/pie.html");
?>
	</body>
</html>
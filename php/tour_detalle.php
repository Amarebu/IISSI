<?php
	session_start();

	require_once("gestionBD.php");

	$idTour = null;
	if (isset($_REQUEST["ID_TOUR"])){
		$idTour = $_REQUEST["ID_TOUR"];
	}

	if (!isset($idTour)) {
		addError("Tour inválido seleccionado");
		Header("Location: consulta_tour.php");
	}

	$_SESSION["tour"] = null;
	
	$datos_tour = null;
	try {
		$conexion = crearConexionBD();
		$stmt = $conexion->prepare("SELECT * FROM TOUR WHERE ID_TOUR=:idtour");
		$stmt->bindParam(':idtour', $idTour);
		$stmt->execute();
		$datos_tour = $stmt->fetch();
		cerrarConexionBD($conexion);

	} catch(PDOException $e ) {
		addError($e->GetMessage());
		Header("Location: consulta_tour.php");
    }
	
	$ruta_imagen="../imagenes/placeholder.png";
	$nombre_tour="Nombre Tour";
	$descripcion="Descripción tour";
	$precio="";
	$duracion="";
	$maxplazas="";

	if ($datos_tour) {
		if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|](\.)[a-z]{2}/i", $datos_tour["FOTO"])){
			$ruta_imagen="../imagenes/" . $datos_tour["FOTO"];

		}else{
		$ruta_imagen= $datos_tour["FOTO"];
		}
		
		$nombre_tour=$datos_tour["NOMBRE"];
		$descripcion=$datos_tour["DESCRIPCION"];
		$precio=$datos_tour["IMPORTE"];
		$duracion=$datos_tour["DURACION"];
		$maxplazas=$datos_tour["MAX_PLAZAS"];
	} else {
		addError("error");
		//Header("Location: consulta_tour.php");
	}

?> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Tour detalle</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>

	<div>
		<h1>Detalle Tour</h1>
	</div>

	<div class="col-2"></div>
	<div class="col-6 trect">

		<div class="col-6">
		<h1 class="col-10"><?php echo $nombre_tour; ?></h1>
		<h3 class="col-3">Precio: <?php echo $precio; ?> €</h3>
		<h3 class="col-3">Max plazas: <?php echo $maxplazas; ?></h3>
		<h3 class="col-4">Duración: <?php echo $duracion; ?>h</h3>
		<p class="col-10">Descripción: <?php echo $descripcion; ?></p>
		</div>
		<img class="col-4" src="<?php echo $ruta_imagen; ?>" alt="Image">

	</div>
	<div class="col-2"></div>

	<h2 class="col-10">Comentarios</h2>
<?php
	$filas = null;
	try {
		$conexion = crearConexionBD();
		$stmt = $conexion->prepare("SELECT TEXTO, NOMBRE FROM COMENTARIO NATURAL JOIN USUARIO WHERE ID_TOUR=:idtour");
		$stmt->bindParam(':idtour', $idTour);
		$stmt->execute();
		$filas = $stmt;
		cerrarConexionBD($conexion);
	} catch(PDOException $e ) {
		addError($e->GetMessage());
		Header("Location: consulta_tour.php");
	}

	foreach($filas as $fila) {
		$nombre_user=$fila["NOMBRE"];
		$comentario=$fila["TEXTO"];
?> 

	<div class="col-2"></div>
	<fieldset class="col-6">
		<legend>
			<?php echo $nombre_user; ?>
		</legend>
		<p class="col-10"><?php echo $comentario; ?></p>
	</fieldset>
	<div class="col-2"></div>
	<div class="col-10"></div>

<?php
	}

	include_once("../html/pie.html");
?>
	</body>
</html>
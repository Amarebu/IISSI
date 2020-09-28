<?php
	session_start();

	require_once("gestionBD.php");

	$idGrupo = null;
	if (isset($_REQUEST["ID_GRUPO"])){
		$idGrupo = $_REQUEST["ID_GRUPO"];
	}

	if (!isset($idGrupo)) {
		addError("Grupo inválido seleccionado");
		Header("Location: consulta_grupos.php");
	}
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Pago</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>


<?php
	$fila = null;
	try {
		$conexion = crearConexionBD();
		$stmt = $conexion->prepare("SELECT IMPORTE, NOMBRE, ID_TOUR FROM GRUPO NATURAL JOIN TOUR WHERE ID_GRUPO=:idGrupo");
		$stmt->bindParam(':idGrupo', $idGrupo);
		$stmt->execute();
		$fila = $stmt->fetch();
		cerrarConexionBD($conexion);
	} catch(PDOException $e ) {
		addError($e->GetMessage());
		Header("Location: consulta_grupos.php");
	}
	if (!$fila) {
		addError("Grupo inválido, seleccione uno de nuevo");
		Header("Location: consulta_grupos.php");
	}
	$coste_tour = $fila["IMPORTE"];
	$id_tour = $fila["ID_TOUR"];
?>
<h3>Pago para el Grupo "<?php echo $fila["NOMBRE"]; ?>"</h3>
<h3>Coste base del tour: <?php echo $coste_tour; ?>€</h3>

<p id="coste_tour" hidden><?php echo $coste_tour; ?></p>

<div class="col-3"></div>
<form action="validacion_pago.php" id="seguros" onchange="ActualizaPrecio()" class="col-4" method="post">
	<p class="col-10">¿Quiere contratar seguro?:</p>
	<input type="hidden" value="<?php echo $idGrupo; ?>" name="id_grupo"/>
	<input type="hidden" value="<?php echo $id_tour; ?>" name="id_tour"/>

	<?php
		$filas = null;
		try {
			$conexion = crearConexionBD();
			$stmt = $conexion->prepare("SELECT * FROM SEGURO WHERE ID_PAGO IS NULL");
			$stmt->execute();
			$filas = $stmt;
			cerrarConexionBD($conexion);
		} catch(PDOException $e ) {
			addError($e->GetMessage());
			Header("Location: consulta_grupos.php");
		}

		foreach($filas as $fila) {
			$tipo_seguro=$fila["TIPO_SEGURO"];
			$importe=$fila["IMPORTE"];
			$id_seguro=$fila["ID_SEGURO"];
	?>

	<div class="col-10">
	<input type="checkbox" name="seguros[]" data-coste="<?php echo $importe; ?>" value="<?php echo $id_seguro; ?>" />
	<?php echo $tipo_seguro; echo ": " . $importe . "€";?>
	</div>
	
	
	<?php
		}
	?>
	<div class="col-10"></div>
	<h3 class="col-5">Precio Total: </h3>
	<h3 id="precio-total" class="col-5"><?php echo $coste_tour; ?>€</h3>
	<input type="submit" class="col-10" name="formSubmit" value="Pagar" />

</form>
<div class="col-3"></div>

<script>
function ActualizaPrecio() {
	var total = document.getElementById("coste_tour").innerHTML;

	var elements = document.querySelectorAll("#seguros input[type=checkbox]");
	for (var i = 0, element; element = elements[i++];) {
		if (element.checked)
			total = Number(total) + Number(element.getAttribute("data-coste"));
	}
	document.getElementById("precio-total").innerHTML = total + "€";
  
}
</script>

<?php
	include_once("../html/pie.html");
?>
	</body>
</html>
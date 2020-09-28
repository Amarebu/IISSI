<?php

session_start();

require_once ("gestionBD.php");
require_once ("paginacion_consulta.php");

if (!isset($_SESSION['user_email']) || $_SESSION['is_guide'])//is_guide se usa aquí para que no se acceda directamente al php si se es guia
	Header("Location: login.php");
else {

	// ¿Venimos simplemente de cambiar página o de haber seleccionado un registro ?
	// ¿Hay una sesión activa?
	if (isset($_SESSION["paginacion"]))
		$paginacion = $_SESSION["paginacion"];

	$pagina_seleccionada = isset($_GET["PAG_NUM"]) ? (int)$_GET["PAG_NUM"] : (isset($paginacion) ? (int)$paginacion["PAG_NUM"] : 1);
	$pag_tam = isset($_GET["PAG_TAM"]) ? (int)$_GET["PAG_TAM"] : (isset($paginacion) ? (int)$paginacion["PAG_TAM"] : 5);

	if ($pagina_seleccionada < 1)
		$pagina_seleccionada = 1;
	if ($pag_tam < 1)
		$pag_tam = 5;

	// Antes de seguir, borramos las variables de sección para no confundirnos más adelante
	unset($_SESSION["paginacion"]);

	$conexion = crearConexionBD();

	// La consulta que ha de paginarse
	try {
		$stmt=$conexion->prepare("SELECT * FROM USUARIO WHERE EMAIL = :email");
		$stmt->bindParam(':email',$_SESSION["user_email"]);
		$stmt->execute();
		$Usuario = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
		

	$IdUsuario = $Usuario["ID_USUARIO"];

	$query = "SELECT PAGO.FECHA_PAGO, PAGO.ID_PAGO, PAGO.IMPORTE, PAGO.ID_GRUPO, TOUR.ID_TOUR, TOUR.NOMBRE FROM PAGO INNER JOIN GRUPO ON PAGO.ID_GRUPO = GRUPO.ID_GRUPO INNER JOIN TOUR ON TOUR.ID_TOUR = GRUPO.ID_TOUR WHERE ID_USUARIO = " . $IdUsuario;

	// Se comprueba que el tamaño de página, página seleccionada y total de registros son conformes.
	// En caso de que no, se asume el tamaño de página propuesto, pero desde la página 1
	$total_registros = total_consulta($conexion, $query);
	$total_paginas = (int)($total_registros / $pag_tam);

	if ($total_registros % $pag_tam > 0)
		$total_paginas++;

	if ($pagina_seleccionada > $total_paginas)
		$pagina_seleccionada = $total_paginas;

	// Generamos los valores de sesión para página e intervalo para volver a ella después de una operación
	$paginacion["PAG_NUM"] = $pagina_seleccionada;
	$paginacion["PAG_TAM"] = $pag_tam;
	$_SESSION["paginacion"] = $paginacion;

	$filas = consulta_paginada($conexion, $query, $pagina_seleccionada, $pag_tam);

	cerrarConexionBD($conexion);
}
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Historial de Pagos</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
include_once ("../html/cabecera.php");
?>

<main class = "col-10">
	<div class="col-1"></div>
	<nav>
		
		<form method="get" action="consulta_pago.php" class="col-8 trect">
			<input type="submit" class="col-2" value="Aplicar">
			<div class="col-6">
			<input id="PAG_NUM" name="PAG_NUM" type="hidden" value="<?php echo $pagina_seleccionada?>"/> 
			
			Mostrando

			<input id="PAG_TAM" name="PAG_TAM" type="number"

				min="1" max="<?php echo $total_registros; ?>"

				value="<?php echo $pag_tam?>" autofocus="autofocus" />

			entradas de <?php echo $total_registros?>
			</div>

			<div id="enlaces" class="col-2">
			<span class="current">Página: </span>
				<?php
					for($pagina = 1; $pagina <= $total_paginas; $pagina++)
						if($pagina == $pagina_seleccionada){ ?>
							<span class="current"><?php echo $pagina; ?></span>
				<?php } else { ?>
								<a href="consulta_pago.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
							
				<?php } ?>
				
			</div>
		</form>


	</nav>
	<div class="col-1"></div>
	<div class="col-10"></div>

	<h1 class="col-10">Historial de Pagos</h1>

	<?php


foreach($filas as $fila) {
	$nombre_tour = $fila["NOMBRE"];
	$fecha_pago = $fila["FECHA_PAGO"];
	$importe_pago = $fila["IMPORTE"];
	$grupo = $fila["ID_GRUPO"];

	?>

	<div class="col-2"></div>
	<form method= "post" action= "controlador_pagos.php" class="col-6 trect">
		<input id="ID_PAGO" name="ID_PAGO" type="hidden" value="<?php echo $fila["ID_PAGO"]?>"/>
		<input id="ID_USUARIO" name="FECHA_PAGO" type="hidden" value="<?php echo $IdUsuario ?>"/>
		<input id="ID_TOUR" name="ID_GRUPO" type="hidden" value="<?php echo $fila["ID_GRUPO"] ?>"/>


		<h1 class="col-10"><?php echo $nombre_tour; ?></h1>
		<h4 class="col-3">Importe: <?php echo $importe_pago; ?>€</h4>
		<h4 class="col-4">Grupo: <?php echo $grupo; ?></h4>
		<h4 class="col-3">Fecha: <?php echo $fecha_pago; ?></h4>
		
		<div class="col-4"></div>
		<button id="comentar" name="comentar" type="submit" value="comentar" class="col-2">Comentar</button>
		<div class="col-4"></div>
	</form>
	<div class="col-2"></div>
	<div class="col-10"></div>
			
				
	<?php } ?>
	</div>

</main>


<?php
include_once ("../html/pie.html");
?>	
	</body>	
</html>
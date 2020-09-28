<?php
session_start();

require_once ("gestionBD.php");
require_once ("paginacion_consulta.php");

if (!isset($_SESSION['user_email']))
	Header("Location: login.php");
else {

	if (isset($_SESSION["grupo"])) {
		$grupo = $_SESSION["grupo"];
		unset($_SESSION["grupo"]);
	}

	// ¿Venimos simplemente de cambiar página o de haber seleccionado un registro ?
	// ¿Hay una sesión activa?
	if (isset($_SESSION["paginacion"]))
		$paginacion = $_SESSION["paginacion"];
	
	$pagina_seleccionada = isset($_GET["PAG_NUM"]) ? (int)$_GET["PAG_NUM"] : (isset($paginacion) ? (int)$paginacion["PAG_NUM"] : 1);
	$pag_tam = isset($_GET["PAG_TAM"]) ? (int)$_GET["PAG_TAM"] : (isset($paginacion) ? (int)$paginacion["PAG_TAM"] : 5);

	if ($pagina_seleccionada < 1) 		$pagina_seleccionada = 1;
	if ($pag_tam < 1) 		$pag_tam = 5;

	// Antes de seguir, borramos las variables de sección para no confundirnos más adelante
	unset($_SESSION["paginacion"]);

	$conexion = crearConexionBD();

	// La consulta que ha de paginarse
	if($_SESSION["is_guide"]){
		try {
			$stmt=$conexion->prepare("SELECT * FROM GUIA WHERE EMAIL = :email");
			$stmt->bindParam(':email',$_SESSION["user_email"]);
			$stmt->execute();
			$Guia = $stmt->fetch();
		} catch(PDOException $e) {
			return $e->getMessage();
		}
			
	
		$IdGuia = $Guia["ID_GUIA"];

		$query = 'SELECT * FROM GRUPO NATURAL JOIN TOUR WHERE ID_TOUR = ID_TOUR AND FECHA > CURRENT_DATE AND ID_GUIA ='.  $IdGuia .'ORDER BY FECHA';
	}else{
			$query = 'SELECT * FROM GRUPO NATURAL JOIN TOUR WHERE ID_TOUR = ID_TOUR AND FECHA > CURRENT_DATE ORDER BY FECHA';
	}

	// Se comprueba que el tamaño de página, página seleccionada y total de registros son conformes.
	// En caso de que no, se asume el tamaño de página propuesto, pero desde la página 1
	$total_registros = total_consulta($conexion, $query);
	$total_paginas = (int)($total_registros / $pag_tam);

	if ($total_registros % $pag_tam > 0)		$total_paginas++;

	if ($pagina_seleccionada > $total_paginas)		$pagina_seleccionada = $total_paginas;

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
		<title>TL: Grupos</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>


<main class="col-10">

	<div class="col-1"></div>
	<nav>

		<form method="get" action="consulta_tour.php" class="col-8 trect">
			<input type="submit" class="col-2" value="Aplicar">
			<div class="col-6">
			<input id="PAG_NUM" name="PAG_NUM" type="hidden" value="<?php echo $pagina_seleccionada?>"/>

			Mostrando

			<input id="PAG_TAM" name="PAG_TAM" type="number"

				min="1" max="<?php echo $total_registros; ?>"

				value="<?php echo $pag_tam?>" autofocus="autofocus"/>

			entradas de <?php echo $total_registros?>
			</div>

			<div id="enlaces" class="col-2">
			<span class="current">Página: </span>
			<?php

				for( $pagina = 1; $pagina <= $total_paginas; $pagina++ )
					if ( $pagina == $pagina_seleccionada) { 	?>
						<span class="current"><?php echo $pagina; ?></span>
			<?php }	else { ?>
						<a href="consulta_grupos.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
			<?php } ?>

			</div>
		</form>

	</nav>
	<div class="col-1"></div>
	<div class="col-10"></div>


	<?php
if($_SESSION["is_guide"]) ?> <div class="col-10"><h1>Estos son los grupos activos</h1> </div>
<?php foreach($filas as $fila) { ?>
		
		<div class="col-1"></div>
		<form method="post" action="pago.php"class="col-8">

			<div >
				<input id="ID_GRUPO" name="ID_GRUPO"
					type="hidden" value="<?php echo $fila["ID_GRUPO"];?>"/>

				<?php

				if ($_SESSION["is_guide"]) { ?>


						<!-- SI ES GUIA -->
						<fieldset class="trect" class="col-10">
							<input id="ID_GRUPO" name="ID_GRUPO" type="hidden" value="<?php echo $fila["ID_GRUPO"]; ?>"/>
							<input id="ID_TOUR" name="ID_TOUR" type="hidden" value="<?php echo $fila["ID_TOUR"]; ?>"/>
							<input id="FECHA" name="FECHA" type="hidden" value="<?php echo $fila["FECHA"]; ?>"/>


							
								<div class="col-6">
								<h3 class=""><u><?php echo $fila["NOMBRE"]; ?></u></h3>
								<h3 class="">Se llevará a cabo el <?php echo $fila["FECHA"]; ?>
								a las <?php echo $fila["HORA"]; ?> h</h3>
								<h3 class="">Durará: &nbsp; <?php echo $fila["DURACION"]; ?> &nbsp; horas.</h3>
								<h3 class="">A partir de &nbsp; <?php echo $fila["IMPORTE"]; ?> &nbsp; €</h3>
								<?php if($fila["SUFICIENTE"]=1) { ?> <h4>Ya hay suficientes usuarios inscritos para que el tour se lleve a cabo.</h4> 
								<?php }else{ ?>
									<h4>Aún no hay suficientes usuarios inscritos para que el tour se lleve a cabo.</h4>
								<?php } ?>
								<h3 class="">Máximo &nbsp; <?php echo $fila["MAX_PLAZAS"]; ?> &nbsp; personas</h3>
								</div>

								<?php if(!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|](\.)[a-z]{2}/i", $fila["FOTO"])) {?>
								<img class="col-4" src="<?php echo "../imagenes/" . $fila["FOTO"]; ?>" alt="Image">
								<?php }else { ?>
								<img class="col-4" src="<?php echo $fila["FOTO"]; ?>" alt="Image">
								<?php }
								?>





						

				<?php }	else { ?>
					

						<!-- SI ES USUARIO -->
						<fieldset class="trect" class="col-10">
							
							<input id="ID_GRUPO" name="ID_GRUPO" type="hidden" value="<?php echo $fila["ID_GRUPO"]; ?>"/>
							<input id="ID_TOUR" name="ID_TOUR" type="hidden" value="<?php echo $fila["ID_TOUR"]; ?>"/>
							<input id="FECHA" name="FECHA" type="hidden" value="<?php echo $fila["FECHA"]; ?>"/>
							

							
								<div class="col-6">
								<h3 class=""><u><?php echo $fila["NOMBRE"]; ?></u></h3>
								<h3 class="">Se llevará a cabo el  <?php echo $fila["FECHA"]; ?>
								a las <?php echo $fila["HORA"]; ?> h</h3>
								<h3 class="">Durará: &nbsp; <?php echo $fila["DURACION"]; ?> &nbsp; horas.</h3>
								<h3 class="">A partir de &nbsp; <?php echo $fila["IMPORTE"]; ?> &nbsp; €</h3>
								<?php if($fila["SUFICIENTE"]===1) { ?> <h4>Ya hay suficientes usuarios inscritos para que el tour se lleve a cabo.</h4> 
								<?php }else{ ?>
									<h4>Aún no hay suficientes usuarios inscritos para que el tour se lleve a cabo, ¡participa!</h4>
								<?php } ?>
								<h3 class="">Máximo &nbsp; <?php echo $fila["MAX_PLAZAS"]; ?> &nbsp; personas</h3>
								<?php
								try{
								$consulta = 
								$stmt = $conexion->prepare("SELECT COUNT(*) AS TOTAL FROM PARTICIPAEN WHERE ID_GRUPO=:id_grupo");
								$stmt->bindParam(':id_grupo',$fila["ID_GRUPO"]);
								$stmt->execute();
								$aforo= $stmt->fetch();
								}catch(PDOException $e){
									return $e->getMessage();
								}
								if($fila["MAX_PLAZAS"] > $aforo["TOTAL"]){
								?>
									<h3 class="">Quedan &nbsp; <?php echo $fila["MAX_PLAZAS"]-$aforo["TOTAL"]; ?> &nbsp; plazas</h3>

								<?php
								}else {?>
									<h3 class="">¡Plazas agotadas!</h3>

								<?php }
								?>

								
								

								</div>

								<?php if(!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|](\.)[a-z]{2}/i", $fila["FOTO"])) {?>
								<img class="col-4" src="<?php echo "../imagenes/" . $fila["FOTO"]; ?>" alt="Image">
								<?php }else { ?>
								<img class="col-4" src="<?php echo $fila["FOTO"]; ?>" alt="Image">
								<?php }
								?>

				
				<?php } ?>

				<div class="col-10"></div>
				<div id="botones_fila" class="col-10">
					<?php
						if(!$_SESSION["is_guide"]) {?>

					<div class="col-4"></div>
					<button id="participar" name="participar" type="submit" class="col-2">Participar</button>
					<div class="col-4"></div>
				<?php } ?>
				</div>
				</fieldset>
			</div>

	
		</form>
		<div class="col-1"></div>
		<div class="col-10"></div>

	<?php } ?>

	</div>
</main>


<?php
	include_once("../html/pie.html");
?>
	</body>
</html>
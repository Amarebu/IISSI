<?php
session_start();

require_once ("gestionBD.php");
require_once ("modificarTours.php");
require_once ("paginacion_consulta.php");

{

	if (isset($_SESSION["tour"])) {
		$tour = $_SESSION["tour"];
		unset($_SESSION["tour"]);
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
	if(isset($_SESSION["is_guide"]) && $_SESSION["is_guide"]){
		try {
			$stmt=$conexion->prepare("SELECT * FROM GUIA WHERE EMAIL = :email");
			$stmt->bindParam(':email',$_SESSION["user_email"]);
			$stmt->execute();
			$Guia = $stmt->fetch();
		} catch(PDOException $e) {
			return $e->getMessage();
		}
			
	
		$IdGuia = $Guia["ID_GUIA"];
		$query = 'SELECT * FROM TOUR WHERE ID_GUIA =' . $IdGuia;
	}else{
	$query = 'SELECT * FROM TOUR';
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
		<title>TL: Tours</title>
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
						<a href="consulta_tour.php?PAG_NUM=<?php echo $pagina; ?>&PAG_TAM=<?php echo $pag_tam; ?>"><?php echo $pagina; ?></a>
			<?php } ?>

			</div>
		</form>

	</nav>
	<div class="col-1"></div>
	<div class="col-10"></div>


	<?php

foreach($filas as $fila) {
	
	?>
		
		<div class="col-1"></div>
		<form method="post" action="controlador_tours.php" class="col-8">

			<div >
					<input id="ID_TOUR" name="ID_TOUR"

						type="hidden" value="<?php echo $fila["ID_TOUR"]; ?>"/>

					<input id="ID_GUIA" name="ID_GUIA"

						type="hidden" value="<?php echo $fila["ID:GUIA"]; ?>"/>

					<input id="TOUR" name="TOUR"

						type="hidden" value="<?php echo $fila["TOUR"]; ?>"/>

					<input id="DURACION" name="DURACION"

						type="hidden" value="<?php echo $fila["DURACION"]; ?>"/>

					<input id="DESCRIPCION" name="DESCRIPCION"

						type="hidden" value="<?php echo $fila["DESCRIPCION"]; ?>"/>
					
					<input id="IMPORTE" name="IMPORTE"

						type="hidden" value="<?php echo $fila["IMPORTE"]; ?>"/>
						
					<input id="MAX_PLAZAS" name="MAX_PLAZAS"

						type="hidden" value="<?php echo $fila["MAX_PLAZAS"]; ?>"/>



				<?php

					if (isset($tour) and ($tour["ID_TOUR"] == $fila["ID_TOUR"])) { ?>

						<!-- Editando título -->
						<fieldset class="trect" class="col-10">
							<input id="ID_TOUR" name="ID_TOUR" type="hidden" value="<?php echo $fila["ID_TOUR"]; ?>"/>
							<input id="ID_GUIA" name="ID_GUIA" type="hidden" value="<?php echo $fila["ID_GUIA"]; ?>"/>
							<div class="col-10">
								<label class="col-3">Nombre del tour:</label>
								<input class="col-7" id="NOMBRE" name="NOMBRE" type="text" value="<?php echo $fila["NOMBRE"]; ?>"/>
								<div class="col-10"></div>
								<label class="col-3">Tipo de tour:</label>
								<select class="col-7" id= "TOUR" name="TOUR">
									<option value="HISTORICO">Histórico</option>
									<option value="GASTRONOMICO">Gastronómico</option>
									<option value="RELIGIOSO">Religioso</option>
									<option value="MONUMENTAL">Monumental</option>
								</select>
								<div class="col-10"></div>
								<label class="col-3">Duración:</label>
								<input class="col-7" id="DURACION" name="DURACION" type="number" value="<?php echo $fila["DURACION"]; ?>"/>
								<div class="col-10"></div>
								<label class="col-3">Descripción:</label>
								<input class="col-7" id="DESCRIPCION" name="DESCRIPCION" type="text" value="<?php echo $fila["DESCRIPCION"]; ?>"/>
								<div class="col-10"></div>
								<label class="col-3">Coste:</label>
								<input class="col-7" id="IMPORTE" name="IMPORTE"  type="number" value="<?php echo $fila["IMPORTE"]; ?>"/>
								<div class="col-10"></div>
								<label class="col-3">Plazas máximas:</label>
								<input class="col-7" id="MAX_PLAZAS" name="MAX_PLAZAS" type="number" value="<?php echo $fila["MAX_PLAZAS"]; ?>"/>
								<div class="col-10"></div>
							</div>
						

				<?php }	else { ?>

						<!-- mostrando título -->
						<fieldset class="trect" class="col-10">
							
							<input id="ID_TOUR" name="ID_TOUR" type="hidden" value="<?php echo $fila["ID_TOUR"]; ?>"/>
							<input id="ID_GUIA" name="ID_GUIA" type="hidden" value="<?php echo $fila["ID_GUIA"]; ?>"/>
							<input id="NOMBRE" name="NOMBRE" type="hidden" value="<?php echo $fila["NOMBRE"]; ?>"/>
							<input id="TOUR" name="TOUR" type="hidden" value="<?php echo $fila["TOUR"]; ?>"/>
							<input id="DURACION" name="DURACION" type="hidden" value="<?php echo $fila["DURACION"]; ?>"/>
							<input id="DESCRIPCION" name="DESCRIPCION" type="hidden" value="<?php echo $fila["DESCRIPCION"]; ?>"/>
							<input id="IMPORTE" name="IMPORTE" type="hidden" value="<?php echo $fila["IMPORTE"]; ?>"/>
							<input id="MAX_PLAZAS" name="MAX_PLAZAS" type="hidden" value="<?php echo $fila["MAX_PLAZAS"]; ?>"/>
							
							<div class="col-6">
								<h1 class="col-8"><?php echo $fila["NOMBRE"]; ?></h1>
								<h3 class="col-3">Precio: <?php echo $fila["IMPORTE"]; ?> €</h3>
								<h3 class="col-3">Max plazas: <?php echo $fila["MAX_PLAZAS"]; ?></h3>
								<h3 class="col-4">Duración: <?php echo $fila["DURACION"]; ?>h</h3>
							</div>
							
							<?php if(!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|](\.)[a-z]{2}/i", $fila["FOTO"])) {?>
							<img class="col-4" src="<?php echo "../imagenes/" . $fila["FOTO"]; ?>" alt="Image">
							<?php }else { ?>
							<img class="col-4" src="<?php echo $fila["FOTO"]; ?>" alt="Image">
							<?php }
							?>
							<p class="col-10">Descripcion:<br><br><?php echo $fila["DESCRIPCION"]; ?></p>
						
				<?php } ?>
				

				<div class="col-10"></div>
				<div id="botones_fila" class="col-10">
					<?php
						if(isset($_SESSION["is_guide"]) && $_SESSION["is_guide"]) {
					?>
						<div class="col-1"></div>
						<button id="comentarios" name="comentarios" type="submit" class="col-3">Comentarios</button>
						<div class="col-2"></div>
	
					<?php if (isset($tour) and ($tour["ID_TOUR"] == $fila["ID_TOUR"])) { ?>
	
							<button id="grabar" name="grabar" type="submit" class="col-3">
	
								Guardar
	
							</button>
	
					<?php } else { ?>
	
							<button id="editar" name="editar" type="submit" class="col-3">
	
								Editar 
	
							</button>
	
					<?php } ?>
						<div class="col-10"></div>
						<div class="col-1"></div>
						<button id="borrar" name="borrar" type="submit" class="col-3">
	
							Borrar 
	
						</button>
	
						<div class="col-2"></div>
						<button id="nuevo" name="nuevo" type="submit" class="col-3">
	
							Nuevo Grupo 
	
						</button>
	
						<div class="col-2"></div>
						
					
				<?php } else { ?>
					<div class="col-4"></div>
					<button id="comentarios" name="comentarios" type="submit" class="col-2">Comentarios</button>
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
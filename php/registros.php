<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TL: Registro</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	</head>
	<body>
<?php
	include_once("../html/cabecera.php");
?>
<?php
    if (isset($_POST["guia"])) {
		header("Location: r_guia.php");        
    }elseif (isset($_POST["usuario"])) {
		header("Location: r_usuario.php");        
    }

?>
		<div class="col-10">
			<div class="col-2"></div>
			<h2 class="col-6">
				¿Cómo quieres registrarte?
			</h2>
			<div class="col-2"></div>
			<div class="col-10">
			<form action="" method="POST">
				<div class="col-4"></div>
				<input type="submit" class="col-2" name="guia" value="Nuevo Guia">
				<div class="col-10"></div>
				<div class="col-4"></div>
				<input type="submit" class="col-2" name="usuario" value="Nuevo Usuario">
			</form>
		</div>
<?php
	include_once("../html/pie.html");
?>
	</body>
</html>
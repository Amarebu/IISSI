<?php
	session_start();
	
	require_once("./gestionBD.php");
	
	if (!isset($_SESSION["formularioguia"])) {
		$formularioguia['nombre'] = "";
		$formularioguia['apellidos'] = "";
		$formularioguia['dni'] = "";
		$formularioguia['telefono'] = "";
		$formularioguia['email']="";
		$formularioguia['numero_acreditacion'] = "";
		$formularioguia['pass'] = "";
			
		$_SESSION["formularioguia"] = $formularioguia;
	}
	else
		$formularioguia = $_SESSION["formularioguia"];
		
	$conexion = crearConexionBD();
?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	<script src="js/validacion_cliente_alta_guia.js" type="text/javascript"></script>
	<title>TL:Registro Guía</title>
</head>

<body>
	<script>
		$(document).ready(function() {
			$("#altaGuia").on("submit", function() {
				return validateForm();
			});
		});
	</script>
<?php
	include_once("../html/cabecera.php");
?>
	<div>
		<h1>Reguistro de guías</h1>
		<h2>Inserta tus datos y comienza a trabajar con nosotros</h2>
	</div>
	<div class="col-1"></div>
	<div class="col-8">
		<p class="col-10"><i>Los campos marcados con <em>*</em> son obligatorios</i></p>
		<fieldset class="col-10">
		<legend>
			Datos Personales
		</legend>
		<form method="POST" class="col-10" id="altaGuia" action="./validacion_registro_guia.php">
			<label class="col-2">Nombre*: </label>
			<input type="text" class="col-8" name="NOMBRE" value="<?php echo $formularioguia['nombre'];?>"  maxlength="40" size="40" required>
			<div class="col-10"></div>
			<label class="col-2">Apellidos*: </label>
			<input type="text" class="col-8" name="APELLIDOS" value="<?php echo $formularioguia['apellidos'];?>" maxlength="80" size="40" required>
			<div class="col-10"></div>
			<label class="col-2">DNI*: </label>
			<input type="text" class="col-8" name="DNI" value="<?php echo $formularioguia['dni'];?>" pattern="^[0-9]{8}[A-Za-z]" title="8 dígitos y letra final" placeholder="8 digitos y letra final" required>
			<div class="col-10"></div>
			<label class="col-2">E-mail*: </label>
			<input type="email" class="col-8" name="EMAIL" value="<?php echo $formularioguia['email'];?>" required>
			<div class="col-10"></div>
			<label class="col-2">Número de Acreditación: </label>
			<input type="number" class="col-8" name="NUM_ACREDITACION" value="<?php echo $formularioguia['numero_acreditacion'];?>">
			<div class="col-10"></div>
			<label class="col-2">Password*: </label>
			<input type="password" class="col-8" name="PASS" id="PASS" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,}" placeholder="mínimo 6 caracteres entre letras y números" size= "50" required oninput="passwordValidation();">
			<div class="col-10"></div>
			<label class="col-2">Confirmar Password*: </label>
			<input type="password" class="col-8" name="CONFIRMPASS" id="confirmpass" placeholder="Confirmación de contraseña"  oninput="passwordConfirmation();" required>
			
			<div class="col-10"></div>
			<div class="col-3"></div>
			<input type="submit" class="col-4" name="submit" value="submit">
			<div class="col-3"></div>
		</form>
		</fieldset>
	</div>
	<div class="col-1"></div>

<?php
	include_once("../html/pie.html");
	cerrarConexionBD($conexion);
?>
</body>
</html>


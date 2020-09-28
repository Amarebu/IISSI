<?php
	session_start();
	
	require_once("./gestionBD.php");
	
	if (!isset($_SESSION["formulariousuario"])) {
		$formulariousuario['nombre'] = "";
		$formulariousuario['apellidos'] = "";
		$formulariousuario['dni'] = "";
		$formulariousuario['telefono'] = "";
		$formulariousuario['email']="";
		$formulariousuario['feha_nacimiento'] = "";
		$formulariousuario['numero_acreditacion'] = "";
		$formulariousuario['pass'] = "";
			
		$_SESSION["formulariousuario"] = $formulariousuario;
	}
	else
		$formulariousuario = $_SESSION["formulariousuario"];
		
	$conexion = crearConexionBD();
?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
	<script src="js/validacion_cliente_alta_usuario.js" type="text/javascript"></script>
	<title>TL: Registro Usuario</title>
</head>

<body>
	<script>
		$(document).ready(function() {
			$("#altaUsuario").on("submit", function() {
				return validateForm();
			});
		});
	</script>

<?php
	include_once("../html/cabecera.php");
?>
	<div>
		<h1>Reguistro de usuarios</h1>
		<h2>Inserta tus datos y comienza desbubrir con nosotros</h2>
	</div>
	<div class="col-1"></div>
	<div class="col-8">
		<p class="col-10"><i>Todos los campos son obligatorios</i></p>

		<fieldset class="col-10">
		<legend>
			Datos Personales
		</legend>
		<form method="POST" class="col-10" id="altaUsuario" action="./validacion_registro_usuario.php">
			<label class="col-2">Nombre:</label>
			<input type="text" class="col-8" name="NOMBRE" value="<?php echo $formulariousuario['nombre'];?>"  maxlength="40" size="40" required>
			<div class="col-10"></div>
			<label class="col-2">Apellidos: </label>
			<input type="text" class="col-8" name="APELLIDOS" value="<?php echo $formulariousuario['apellidos'];?>" maxlength="80" size="40" required>
			<div class="col-10"></div>
			<label class="col-2">DNI: </label>
			<input type="text" class="col-8" name="DNI" value="<?php echo $formulariousuario['dni'];?>" pattern="^[0-9]{8}[A-Za-z]" title="8 dígitos y letra final" placeholder="8 digitos y letra final" required>
			<div class="col-10"></div>
			<label class="col-2">Teléfono: </label>
			<input type="text" class="col-8" name="TELEFONO" value="<?php echo $formulariousuario['telefono'];?>" pattern="^[0-9]{9}" placeholder="9 dígitos" required>
			<div class="col-10"></div>
			<label class="col-2">E-mail: </label>
			<input type="email" class="col-8" name="EMAIL" value="<?php echo $formulariousuario['email'];?>" required>
			<div class="col-10"></div>
			<label class="col-2">Fecha de nacimiento: </label>
			<input type="date" class="col-8" name="FECHA_NACIMIENTO" value="<?php echo $formulariousuario['fecha_nacimiento'];?>" max="2020-01-01" required>
			<div class="col-10"></div>
			<label class="col-2">Password: </label>
			<input type="password" class="col-8" name="PASS" id="PASS" pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,}" placeholder="mínimo 6 caracteres entre letras y números" size= "50" required oninput="passwordValidation();">
			<div class="col-10"></div>
			<label class="col-2">Confirmar Password: </label>
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
/*
// Sólo para comprobar si funciona el formulario 
		pre_r($_POST);
function pre_r($array){
	echo '<pre>';
	print_r($array);
	echo '</pre>';
} 
 */
?>
		

<?php
	include_once("../html/pie.html");
	cerrarConexionBD($conexion);
?>
</body>
</html>


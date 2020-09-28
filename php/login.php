<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Login usuario</title>
	<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
</head>
<body>
<?php
	include_once("../html/cabecera.php");
?>

<div class="col-2"></div>
<form id="login_form" class="col-6" method="post" action="validacion_login.php">
	<div class="col-10">
		<label for="fuser" class="col-3">Usuario:</label>
        <input class="col-7" type="email" id="fuser" name="fuser" required>
	</div>
	<div class="col-10">
		<label for="fpass" class="col-3">Contraseña:</label>
		<input class="col-7" type="password" id="fpass" name="fpass" 
			pattern="(?=.*\d)(?=.*[a-zA-Z]).{6,}" required
			oninvalid="this.setCustomValidity('La contraseña debe tener al menos una letra, un número y 6 caracteres en total.')"
			oninput="this.setCustomValidity('')">
	</div>
	<div>
		<input type="submit" class="col-10" value="Login">
		<div class="col-10"></div>
		<button id="registerButton" class="col-10" >Registrarse</button>
	</div>
</form>
<div class="col-2"></div>


<script type="text/javascript">
    document.getElementById("registerButton").onclick = function () {
        location.href = "registros.php";
    };
</script>

<?php
	include_once("../html/pie.html");
?>

</body>
</html>
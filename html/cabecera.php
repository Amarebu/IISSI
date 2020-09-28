<?php
if (session_id() == "")
	session_start();
?>

<header class="contenido" id="cabecera">
	<div class="fondo_blanco">
		<img src="../imagenes/logo-tourist-lane.png" alt="Tourist Lane">
	</div>
	<h1>VIAJA EN COMPAÑÍA</h1>
	<p>Gestión de guías, tours y grupos</p>
	</img>
	
</header>

<!-- Tab links -->
<div class="tab">
	<button id="toursTab" name="toursTab" class="tablinks">Tours</button>
	<?php
	if (isset($_SESSION["user_email"])) {
		echo '<button id="gruposTab" name="gruposTab" class="tablinks">Grupos Activos</button>';
		echo '<button id="perfilTab" name="perfilTab" class="tablinks">Perfil</button>';
		echo '<button id="logoutTab" name="logoutTab" class="tablinks">Logout</button>';
	} else {
		echo '<button id="registerTab" name="registerTab" class="tablinks">Registro</button>';
		echo '<button id="loginTab" name="loginTab" class="tablinks">Login</button>';
	}
?>
</div>

<?php
$errores = null;
if (isset($_SESSION["errores"])) {
	$errores = $_SESSION["errores"];
	unset($_SESSION["errores"]);
}
if (count($errores) > 0) { 
	echo '<div id="error_report" class="error_report">';
	foreach($errores as $error){
		echo $error;
		echo "<br>";
	} 
	echo '</div>';
}

$mensajes = null;
if (isset($_SESSION["mensajes"])) {
	$mensajes = $_SESSION["mensajes"];
	unset($_SESSION["mensajes"]);
}
if (count($mensajes) > 0) { 
	echo '<div id="mensajes" class="mensajes">';
	foreach($mensajes as $mensaje){
		echo $mensaje;
		echo "<br>";
	} 
	echo '</div>';
}
?>

<script src="../js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script type="text/javascript"> 
	$(document).ready( function() {
	  $('#error_report').delay(10000).fadeOut();
	});
	$(document).ready( function() {
	  $('#mensajes').delay(5000).fadeOut();
	});

	// Main
	var cabecera = document.getElementById('cabecera');

	cabecera.style.cursor = 'pointer';
	cabecera.onclick = function() {
		window.location.href = "../index.php";
	};

	// toursTab
	var toursTab = document.getElementById('toursTab');

	toursTab.style.cursor = 'pointer';
	toursTab.onclick = function() {
		window.location.href = "consulta_tour.php";
	};

<?php
	if (isset($_SESSION["user_email"])) {
?>
	// logoutTab
	var logoutTab = document.getElementById('logoutTab');

	logoutTab.style.cursor = 'pointer';
	logoutTab.onclick = function() {
		window.location.href = "logout.php";
	};

	// gruposTab
	var gruposTab = document.getElementById('gruposTab');

	gruposTab.style.cursor = 'pointer';
	gruposTab.onclick = function() {
		window.location.href = "consulta_grupos.php";
	};

	// perfilTab
	var perfilTab = document.getElementById('perfilTab');

	perfilTab.style.cursor = 'pointer';
	perfilTab.onclick = function() {
		window.location.href = "perfil.php";
	};
<?php
	} else {
?>
	// loginTab
	var loginTab = document.getElementById('loginTab');

	loginTab.style.cursor = 'pointer';
	loginTab.onclick = function() {
		window.location.href = "login.php";
	};

	// registerTab
	var registerTab = document.getElementById('registerTab');

	registerTab.style.cursor = 'pointer';
	registerTab.onclick = function() {
		window.location.href = "registros.php";
	};
<?php
	}
?>
</script>

<div class="contenido">
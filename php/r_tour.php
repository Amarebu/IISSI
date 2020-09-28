<?php
	session_start();
	require_once("gestionBD.php");
	
if(!isset($_SESSION["user_email"]) || !isset($_SESSION["is_guide"]) ||$_SESSION["is_guide"] === FALSE){
	addError("Se ha intentado acceder a una página no válida. Por favor, entre en la cuenta correcta.");
	Header("Location: logout.php");
}else{
	$conexion = crearConexionBD();

	if (!isset($_SESSION["formulariotour"])) {
		$formulariotour['IdGuia']="";
		$formulariotour['Titulo'] = "";
		$formulariotour['Duracion'] = "";
		$formulariotour['Descripcion'] = "";
		$formulariotour['Coste'] = "";
		$formulariotour['max_plazas'] = "";
		
		$_SESSION["formulariotour"] = $formulariotour;
	}
	else
		$formulariotour = $_SESSION["formulariotour"];


	try {
		$stmt=$conexion->prepare("SELECT * FROM GUIA WHERE EMAIL = :email");
		$stmt->bindParam(':email',$_SESSION["user_email"]);
		$stmt->execute();
		$Guia = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
		

	$IdGuia = $Guia["ID_GUIA"];
	cerrarConexionBD($conexion);

}
?>

<!DOCTYPE html>
<html lang="es">
<head>
		<meta charset = "UTF-8">
		<title>TL: Registro de un nuevo tour</title>
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
</head>

<?php
	include_once("../html/cabecera.php");
?>
<body>

	<div>
		<h1> Registro de un Nuevo Tour</h1>	
	</div>

	<div class="col-1"></div>
	<div class="col-8">
		<p class="col-10"><i>Todos los campos son obligatorios</i></p>
		
		<fieldset class="col-10">
		<legend>
			Tour
		</legend>	
		<form class="col-10" action="./validacion_tour.php" method="POST" id="r_indicencias">
			<input type="hidden" name="IdGuia" value="<?php echo $IdGuia ?>" required />
			<label class="col-2">Titulo: </label>
			<input type="text" class="col-8" name="Titulo" maxlength="50" required/>
			<div class="col-10"></div>
			<label class="col-2">Tipo de tour: </label>
			<select class="col-8" id= "Tour" name="Tour">
				<option value="HISTORICO">Histórico</option>							
				<option value="GASTRONOMICO">Gastronómico</option>
				<option value="RELIGIOSO">Religioso</option>						
				<option value="MONUMENTAL">Monumental</option>
			</select>			
			<div class="col-10"></div>
			<label class="col-2">Duracion: </label>
			<input type="number" class="col-8" name="Duracion" maxlength="2" max="24" min="0"  required/>
			<div class="col-10"></div>
			<label class="col-2">Descripcion: </label>
			<input type="text" class="col-8" name="Descripcion" maxlength="4000" required/>
			<div class="col-10"></div>
			<label class="col-2">Coste: </label>
			<input type="number" min="1" step="any" class="col-8" name="Coste" maxlength="40" required/>
			<div class="col-10"></div>
			<label class="col-2">Max Plazas: </label>
			<input type="number" class="col-8" name="max_plazas" maxlength="3" min="0" required/>
			<div class="col-10"></div>
			<label class="col-2">Foto: </label>
			<input type="url" class="col-8" name="Foto" value=""/>
			<div class="col-10"></div>
			<div class="col-3"></div>
			<input type="submit" class="col-4" name="Enviar" value="submit"/>
			<div class="col-3"></div>
		</form>
		</fieldset>
	</div>
	<div class="col-1"></div>

<?php
	include_once("../html/pie.html");
?>
		
</body>
</html>

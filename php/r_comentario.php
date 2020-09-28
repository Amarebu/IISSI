<?php
	session_start();
	
	require_once("./gestionBD.php");
	
	if (!isset($_SESSION["formulariocomentario"])) {
		$formulariocomentario['IdUsuario'] = "";
		$formulariocomentario['IdTour'] = "";
		$formulariocomentario['Texto'] = "";
		
		$_SESSION["formulariocomentario"] = $formulariocomentario;
	}
	else
		$formulariocomentario = $_SESSION["formulariocomentario"];
	
	$pago = $_SESSION["pago"];

	$fila = null;
	$conexion = crearConexionBD();
	try {
		$stmt = $conexion->prepare("SELECT ID_TOUR FROM GRUPO WHERE ID_GRUPO = :idgrupo");
		$stmt->bindParam(':idgrupo', $pago["ID_GRUPO"]);
		$stmt->execute();
		$fila = $stmt->fetch();
	} catch(PDOException $e ) {
		addError($e->GetMessage());
		Header("Location: consulta_pago.php");
	}
	
	$idTour = $fila["ID_TOUR"];

	try {
		$stmt=$conexion->prepare("SELECT * FROM USUARIO WHERE EMAIL = :email");
		$stmt->bindParam(':email',$_SESSION["user_email"]);
		$stmt->execute();
		$fila = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
	
	$IdUsuario = $fila["ID_USUARIO"];

	cerrarConexionBD($conexion);
?>
    
<!DOCTYPE html>
<html lang="es">
<head>
		<meta charset = "UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/tourist.css" />
		<title>TL: Registro de comentarios</title>
		
</head>
  
<?php
	
	include_once("../html/cabecera.php");
?>
 
<body>
	<div>

		<h1> Registro de comentario</h1>
	</div>	
	
	<div class="col-1"></div>
	<div class="col-8">
	
		
		<fieldset class="col-10">
		<legend>
			Comentario
		</legend>	
	
		<form action="./validacion_comentario.php" class="col-10" method="post" id= "r_comentario">
			<input type="hidden" id="IdUsuario" name="IdUsuario" value="<?php echo $IdUsuario ?>" />
			<input type="hidden" id="IdTour" name="IdTour" value="<?php echo $idTour ?>" />
			<label class="col-2">Comentario: </label>
			<p>
			<textarea name ="texto" id="texto" cols="100" rows="15" maxlength="300" required/></textarea>
			</p>
			<div class="col-10"></div>
			<div class="col-3"></div>
			<input type="submit" class="col-4" name="button" value="Enviar"/>
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

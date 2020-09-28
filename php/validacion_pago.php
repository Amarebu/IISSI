<?php
	session_start();

	require_once("gestionBD.php");

	$id_grupo = null;
	$id_tour = null;
	$seguros = null;
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		// Recogemos los datos del formulario
		$id_grupo = $_POST["id_grupo"];
		$id_tour = $_POST["id_tour"];
		if (isset($_POST["seguros"])) {
			$seguros = $_POST["seguros"];
		}
	}
	else
		Header("Location: consulta_grupos.php");

	$conexion = crearConexionBD();

	
	$query_num_plazas = null;
	$query_max_plazas = null;
	try {
		$stmt=$conexion->prepare("SELECT MAX_PLAZAS AS PLAZAS FROM TOUR WHERE ID_TOUR=:idtour");
		$stmt->bindParam(':idtour', $id_tour);
		$stmt->execute();
		$query_max_plazas = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}

	try {
		$stmt=$conexion->prepare("SELECT COUNT(*) AS PLAZAS FROM PARTICIPAEN WHERE ID_GRUPO=:idgrupo");
		$stmt->bindParam(':idgrupo', $id_grupo);
		$stmt->execute();
		$query_num_plazas = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
	
	if (!$query_num_plazas || !$query_max_plazas|| $query_max_plazas["PLAZAS"] <= $query_num_plazas["PLAZAS"]) {
		addError("No ha sido posible realizar el pago. Revise que el grupo disponga de plazas.");
		Header("Location: consulta_grupos.php");
	}

	// Obtencion user id
	$query = null;
	try {
		$stmt=$conexion->prepare("SELECT * FROM USUARIO WHERE EMAIL = :email");
		$stmt->bindParam(':email',$_SESSION["user_email"]);
		$stmt->execute();
		$query = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
		
	if (!$query) {
		addError("Usuarion inválido");
		Header("Location: consulta_grupos.php");
	}
	$id_usuario = $query["ID_USUARIO"];
	
	// Construccion condicion query seguro
	$cond_id_seguro = "";
	if (count($seguros) > 0) {
		$cond_id_seguro = " WHERE ID_SEGURO = " . $seguros[0];
	}
	for($i=1; $i < count($seguros); $i++) {
		$cond_id_seguro = $cond_id_seguro . " OR ID_SEGURO = " . $seguros[$i];
	}
	$consulta_total = "SELECT SUM(IMPORTE) AS TOTAL FROM (SELECT IMPORTE FROM SEGURO" . $cond_id_seguro . " UNION ALL SELECT IMPORTE FROM TOUR WHERE ID_TOUR = " .  $id_tour . ")";

	try {
		$stmt=$conexion->prepare($consulta_total);
		$stmt->execute();
		$query = $stmt->fetch();
	} catch(PDOException $e) {
		return $e->getMessage();
	}

	if (!$query) {
		addError("Algo fué mal calculando el pago, inténtelo mas tarde.");
		Header("Location: consulta_grupos.php");
	}
	$importe_total = $query["TOTAL"];
	
	// Crea pago
	try {
		//$stmt=$conexion->prepare($query_inserta_pago);
		$stmt=$conexion->prepare("CALL inserta_pago(:usuario, CURRENT_DATE, :total, :grupo)");
		$stmt->bindParam(':usuario', $id_usuario);
		$stmt->bindParam(':total', $importe_total);
		$stmt->bindParam(':grupo', $id_grupo);
		$stmt->execute();
	} catch(PDOException $e) {
		addError("No ha sido posible realizar el pago. Revise que el grupo disponga de plazas.");
		Header("Location: consulta_grupos.php");
		return $e->getMessage();
	}

	// Actualiza participa en
	try {
		$stmt=$conexion->prepare("CALL inserta_participa_en(:usuario, :grupo)");
		$stmt->bindParam(':usuario', $id_usuario);
		$stmt->bindParam(':grupo', $id_grupo);
		$stmt->execute();
	} catch(PDOException $e) {
		return $e->getMessage();
	}
	cerrarConexionBD($conexion);

	addMessage("¡Pago realizado exitosamente!");
	Header("Location: consulta_grupos.php");

?>
<?php	
	session_start();
	
	if (isset($_REQUEST["ID_PAGO"])){
		$pago["ID_PAGO"] = $_REQUEST["ID_PAGO"];
		$pago["ID_USUARIO"] = $_REQUEST["ID_USUARIO"];
		$pago["FECHA_PAGO"] = $_REQUEST["FECHA_PAGO"];
		$pago["IMPORTE"] = $_REQUEST["IMPORTE"];
		$pago["ID_GRUPO"] = $_REQUEST["ID_GRUPO"];

		
		$_SESSION["pago"] = $pago;
			
        if (isset($_REQUEST["comentar"])) Header("Location: r_comentario.php");

	}
	else 
		Header("Location: consulta_pago.php");

?>

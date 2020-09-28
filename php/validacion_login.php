<?php
	session_start();

	require_once("gestionBD.php");

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		// Recogemos los datos del formulario
		$nameUser = $_REQUEST["fuser"];
		$passUser = $_REQUEST["fpass"];
	}
	else
		Header("Location: login.php");

	// Validamos el formulario en servidor
	$conexion = crearConexionBD();
	validarDatosUsuario($conexion, $nameUser, $passUser);
	cerrarConexionBD($conexion);

	// Si se han detectado errores
	if (haveErrors()) {
		Header('Location: login.php');
	} else
		Header('Location: consulta_tour.php');


function validarDatosUsuario($conexion, $nameUser, $passUser){
    // GUIA
    try {
        $stmt = $conexion->prepare("SELECT * FROM GUIA WHERE EMAIL=:mail AND PASS_USER=:pass");
        $stmt->bindParam(':mail',$nameUser);
        $stmt->bindParam(':pass',$passUser);
        $stmt->execute();
        if ($stmt->fetch()) {
            $_SESSION["user_email"] = $nameUser;
            $_SESSION["is_guide"] = TRUE;
            addMessage("¡Bienvenido!");
            return;
        }
    } catch(PDOException $e ) {
        addError($e->GetMessage());
    }
    // GUIA
    try {
        $stmt = $conexion->prepare("SELECT * FROM USUARIO WHERE EMAIL=:mail AND PASS_USER=:pass");
        $stmt->bindParam(':mail',$nameUser);
        $stmt->bindParam(':pass',$passUser);
        $stmt->execute();
        if ($stmt->fetch()) {
            $_SESSION["user_email"] = $nameUser;
            $_SESSION["is_guide"] = FALSE;
            addMessage("¡Bienvenido!");
            return;
        }
    } catch(PDOException $e ) {
        addError($e->GetMessage());
    }

    addError("Credenciales inválidas");
}
?>
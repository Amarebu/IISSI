<?php
    session_start();

    require_once("./gestionBD.php");
    
    $_SESSION["user_email"] = null;
    $_SESSION["is_guide"] = null;

    addMessage("¡Esperamos volver a verte!");

    Header("Location: login.php");

?>
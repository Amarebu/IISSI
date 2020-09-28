<?php
session_start();

if ($_SESSION["is_guide"] === TRUE) {
    Header("Location: perfil_guia.php");
} else {
    Header("Location: perfil_usuario.php");
}

?>
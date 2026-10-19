
<?php
session_start();

include "conexion.php";

$usuario = $_POST["usuario"];
$password = $_POST["password"];

$sql = "SELECT * FROM usuarios WHERE usuario = ? AND password = ?";
$consulta = $conexion->prepare($sql);
$consulta->bind_param("ss", $usuario, $password);
$consulta->execute();

$resultado = $consulta->get_result();

if ($resultado->num_rows > 0) {
    $datos = $resultado->fetch_assoc();

    $_SESSION["usuario_id"] = $datos["id"];
    $_SESSION["usuario"] = $datos["usuario"];

    header("Location: ../principal.php");
    exit();
} else {
    echo "Usuario o contraseña incorrectos.";
}

$consulta->close();
$conexion->close();
?>

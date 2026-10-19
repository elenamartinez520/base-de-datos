
<?php

$conexion = mysqli_connect("localhost", "root", "", "Consecionario");

if (!$conexion) {
    die("Error de conexion: " . mysqli_connect_error());
}

mysqli_set_charset($conexion, "utf8mb4");

echo "Conexion exitosa";

?>

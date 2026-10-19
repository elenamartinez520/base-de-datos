
<?php
session_start();

if (!isset($_SESSION["usuario_id"])) {
    header("Location: login.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel - Flexicredi Autos</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>

    <h1>Bienvenido a Flexicredi Autos</h1>

    <p>
        Hola,
        <?php echo htmlspecialchars($_SESSION["usuario"]); ?>.
        Iniciaste sesión correctamente.
    </p>

    <a href="php/logout.php">Cerrar sesión</a>

</body>
</html>

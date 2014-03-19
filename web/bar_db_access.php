<?php
include 'database_connection.php';

header('Access-Control-Allow-Origin: *');
$connection = connect();

if(! $connection ){
    die('Could not connect: ' . mysqli_error());
}

$verb = $_SERVER['REQUEST_METHOD'];
$resultado;
$rows = array();

switch($verb){
    case 'GET':
        if($_GET['id_BAR'] != null){
            $resultado = mysqli_query($connection, "SELECT * FROM BAR WHERE id_BAR = '" . $_GET['id_BAR']."'") or die('Could not query: ' . mysqli_error($connection));
            print json_encode(mysqli_fetch_assoc($resultado));
        }else{
            $tipoBusqueda = $_GET['tipoBusqueda'];
            $valorBusqueda = $_GET['valorBusqueda'];
            if ($tipoBusqueda != null && $valorBusqueda != null){
                $query = "SELECT * FROM BAR WHERE ".$tipoBusqueda." like '".$valorBusqueda."'";
                $resultado = mysqli_query($connection, $query) or die('Could not query: ' . mysqli_error($connection));
            }
            else
                $resultado = mysqli_query($connection, "SELECT * FROM BAR;") or die('Could not query: ' . mysqli_error($connection));
            while($r = mysqli_fetch_assoc($resultado)) {
                $rows[] = $r;
            }
            print json_encode($rows);

        }

        break;

    case 'POST':
        if($_POST['id_CERVEZA'] != null){
            $resultado = mysqli_query($connection, "UPDATE BAR SET Imagen='".$_POST['imagen']."' WHERE id_BAR='".$_POST['id_BAR']."'")or die('Could not query: ' . mysqli_error($connection));
        }else{
            $resultado = mysqli_query($connection, "INSERT INTO BAR(Nombre, Direccion, Tipo, Aforo, Link, Tematica, Zona) VALUES('".$_POST['name']."', '".$_POST['address']."', ".$_POST['type'].", ".$_POST['crew'].", '".$_POST['link']."', ".$_POST['theme'].", '".$_POST['zone']."')")or die('Could not query: ' . mysqli_error($connection));
        }
        break;

    case 'PUT':
        break;

    default:
        break;
}

disconnect();
?>
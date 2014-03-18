<?php

  
  $connection = connect();

  if(! $connection ){
    die('Could not connect: ' . mysqli_error());
  }

  $verb = $_SERVER['REQUEST_METHOD'];
  $resultado;
  $rows = array();

  switch($verb){
    case 'GET':
      if($_GET['id'] != null){
        $resultado = mysqli_query($connection, "SELECT * FROM BAR WHERE id_BAR = '" . $_GET['id']."'") or die('Could not query: ' . mysqli_error($connection));
        print json_encode(array(mysqli_fetch_assoc($resultado)));
      }else{
        $resultado = mysqli_query($connection, "SELECT * FROM BAR;") or die('Could not query: ' . mysqli_error($connection));
        while($r = mysqli_fetch_assoc($resultado)) {
          $rows[] = $r;
        }
        print json_encode(array("result" => $rows));
      }
      
      break;

    case 'POST':
        $resultado = mysqli_query($connection, "INSERT INTO BAR(Nombre, Direccion, Tipo, Aforo, Link, Tematica, Zona) VALUES('".$_POST['name']."', '".$_POST['address']."', ".$_POST['type'].", ".$_POST['crew'].", '".$_POST['link']."', ".$_POST['theme'].", '".$_POST['zone']."')")or die('Could not query: ' . mysqli_error($connection));

      break;

    case 'PUT':
      break;

    default:
      break;
  }

  disconnect();
?>
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
      if($_GET['id_CERVEZA'] != null){
        $resultado = mysqli_query($connection, "SELECT * FROM CERVEZA WHERE id_CERVEZA = '" . $_GET['id']."'") or die('Could not query: ' . mysqli_error($connection));
        print json_encode(array(mysqli_fetch_assoc($resultado)));
      }else{
        $resultado = mysqli_query($connection, "SELECT * FROM CERVEZA") or die('Could not query: ' . mysqli_error($connection));
        while($r = mysqli_fetch_assoc($resultado)) {
          $rows[] = $r;
        }
        print json_encode(array("result" => $rows));
      }
      
      break;

    case 'POST':
      if($_POST['id_CERVEZA'] != null){
        $resultado = mysqli_query($connection, "UPDATE CERVEZA SET Imagen='".$_POST['imagen']."' WHERE id_CERVEZA='".$_POST['id_CERVEZA']."'")or die('Could not query: ' . mysqli_error($connection));
      }else{
        $resultado = mysqli_query($connection, "INSERT INTO CERVEZA(Nombre, Tipo, Graduacion, Procedencia, Envase) VALUES('".$_POST['nombre']."', ".$_POST['tipo'].", ".$_POST['graduacion'].", '".$_POST['procedencia']."', ".$_POST['envase'].")")or die('Could not query: ' . mysqli_error($connection));
      }

      break;

    case 'PUT':
      break;

    default:
      break;
  }

  disconnect();
?>
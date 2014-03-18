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
      if($_GET['id_CERVEZA'] != null and $_GET['id_BAR'] != null){
        $resultado = mysqli_query($connection, "SELECT * FROM BAR_has_CERVEZA WHERE CERVEZA_id_CERVEZA = '" . $_GET['id_CERVEZA']."' AND BAR_id_BAR = '" . $_GET['id_BAR']."'") or die('Could not query: ' .mysqli_error($connection));
        while($r = mysqli_fetch_assoc($resultado)) {
          $rows[] = $r;
        }
        print json_encode(array($rows));
      }else{
        if($_GET['id_BAR'] != null){
          $resultado = mysqli_query($connection, "SELECT * FROM CERVEZA cer, BAR_has_CERVEZA bhc, WHERE bhc.BAR_id_BAR = '" . $_GET['id_BAR']."' AND bhc.CERVEZA_id_CERVEZA=cer.id_CERVEZA") or die('Could not query: ' . mysqli_error($connection));
          while($r = mysqli_fetch_assoc($resultado)) {
            $rows[] = $r;
          }
          print json_encode(array($rows));
        }
        if($_GET['id_CERVEZA'] != null){
          $resultado = mysqli_query($connection, "SELECT * FROM BAR bar, BAR_has_CERVEZA bhc, WHERE bhc.CERVEZA_id_CERVEZA = '" . $_GET['id_CERVEZA']."' AND bhc.BAR_id_BAR=bar.id_BAR") or die('Could not query: ' . mysqli_error($connection));
          while($r = mysqli_fetch_assoc($resultado)) {
            $rows[] = $r;
          }
          print json_encode(array($rows));
        }
      }
      
      break;

    case 'POST':
      if($_POST['id_CERVEZA'] != null){
        $resultado = mysqli_query($connection, "UPDATE CERVEZA SET Imagen='".$_POST['imagen']."' WHERE id_CERVEZA='".$_POST['id_CERVEZA']."'")or die('Could not query: ' . mysqli_error($connection));
      }else{
        $resultado = mysqli_query($connection, "INSERT INTO CERVEZA(Nombre, Tipo, Graduacion, Procedencia, Envase, Imagen) VALUES('".$_POST['nombre']."', ".$_POST['tipo'].", ".$_POST['graduacion'].", '".$_POST['procedencia']."', ".$_POST['envase'].", '".$_POST['imagen']."')")or die('Could not query: ' . mysqli_error($connection));
      }

      break;

    case 'PUT':
      break;

    default:
      break;
  }

  disconnect();
?>
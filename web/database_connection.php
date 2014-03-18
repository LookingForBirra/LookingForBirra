<?php

function connect(){
  $serverURL = "mysql.hostinger.es";
  $userName = "u951574078_admin";
  $password = "BaresGR2014";
  $database = "u951574078_bdd";

  $connection = mysqli_connect($serverURL, $userName, $password, $database);
  return $connection;
}

function disconnect(){
  mysqli_close($connection);
}
?>
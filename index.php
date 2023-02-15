<?php 





$connection = mysqli_connect("localhost", "root", "root", "testdb", 8889);
if (!$connection){
  echo mysqli_connect_error();
  exit(1);
}
$email = $_POST['email'];
error_log(print_r($_POST,true));
$mdp = sha1($_POST['mdp']);


error_log("$email => $mdp ");
$marequete = "SELECT * FROM `testuser`
              WHERE email = '$email' AND mdp='$mdp'";
error_log($marequete);
//if (isset($email) and isset($mdp)){
  $result = $connection->query($marequete)->fetch_all(MYSQLI_ASSOC);
  if (empty($result)){
    error_log('pas connecter');
    
    $response = array('status' => 0);
    
  } else {
    error_log('connecter');
    
    $response = array('status' => 1);
  }
  //header('Content-Type: application/json');
  echo json_encode($response);

  
  if ($connection->error) {
    error_log("requette   $marequete");
    error_log("Échec de la requette: %s\n". $mysqli->error);
    exit();
  }
//}

error_log(print_r($result, true));

// $result = $connection->query( "SELECT * FROM testuser WHERE email = '$email' AND mdp='$mdp'");


//$count = mysqli_num_rows($result);





  


 



?>
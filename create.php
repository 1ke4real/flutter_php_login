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
              WHERE email = '$email'";
error_log($marequete);
  $result = $connection->query($marequete)->fetch_all(MYSQLI_ASSOC);
  if (empty($result)){
    error_log('Create User');
    $sqlreq = "INSERT INTO `testuser`(email, mdp) VALUES ('$email', '$mdp')";
    $user = $connection->query($sqlreq);
    $response = array('status' => 0);
  } else {
    error_log('User Exist');
    $response = array('status' => 1);
  }
  echo json_encode($response);
  if ($connection->error) {
    error_log("requette   $marequete");
    error_log("Échec de la requette: %s\n". $mysqli->error);
    exit();
  }

error_log(print_r($result, true));



?>
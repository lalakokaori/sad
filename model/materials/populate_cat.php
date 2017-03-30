<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM categories";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['name']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

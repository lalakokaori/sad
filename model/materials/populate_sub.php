<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM subcategories";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['names']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

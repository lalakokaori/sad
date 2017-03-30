<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM categories WHERE status = 'active' ORDER BY name desc";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['id'],
    	$fetch['name'],$fetch['description']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

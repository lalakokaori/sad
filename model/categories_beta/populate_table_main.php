<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM categories_beta WHERE status = 'active' ORDER BY ct_name desc";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['id'],
    	$fetch['ct_name']);				//[0][1] walang [2] 	
  }         
$conn = null;             

echo json_encode($output);
?>    

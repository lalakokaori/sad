<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM subcategories WHERE status = 'active' ORDER BY names desc";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['id'],
    	$fetch['names'],$fetch['description'],$fetch['name']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

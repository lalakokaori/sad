<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM materials WHERE status = 'active' ORDER BY material_desc desc";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['id'],
    	$fetch['name'],$fetch['names'], $fetch['material_desc'],$fetch['uom'],$fetch['rate']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

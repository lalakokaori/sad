<?php
    include('../master/connect.php');


  $sql = "SELECT * FROM labor WHERE status = 'active' ORDER BY labor_desc desc";
  $q = $conn->prepare($sql);
  $q -> execute();
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['labor_id'],
    	$fetch['labor_desc'],$fetch['labor_type'], $fetch['uom'], $fetch['rate']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    

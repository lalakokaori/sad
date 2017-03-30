<?php
    include('../master/connect.php');

  $id = $_POST['id'];

  $sql = "SELECT * FROM materials WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($id));
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['name'],$fetch['names'], $fetch['material_desc'],$fetch['uom'],$fetch['rate']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    
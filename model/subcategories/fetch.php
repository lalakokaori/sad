<?php
    include('../master/connect.php');

  $id = $_POST['id'];

  $sql = "SELECT * FROM subcategories WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($id));
  $browse = $q -> fetchAll();
  foreach($browse as $fetch)
  {
    $output[] = array ($fetch['names'],$fetch['description'],$fetch['name']);				 	
  }         
$conn = null;             

echo json_encode($output);
?>    
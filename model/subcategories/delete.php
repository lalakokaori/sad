<?php
    include('../master/connect.php');

$id = $_POST['id'];

  $sql = "UPDATE subcategories SET status = 'inactive' WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($id));
     
$conn = null;             

echo json_encode($output);
?>    
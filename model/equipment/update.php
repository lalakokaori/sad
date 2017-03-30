<?php
    include('../master/connect.php');

$id = $_POST['id'];
$name = trim($_POST['name']);
$description = trim($_POST['description']);


  $sql = "UPDATE equipment SET name=?, description=? WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($name,$description,$id));
     
$conn = null;             

echo json_encode($output);
?>    
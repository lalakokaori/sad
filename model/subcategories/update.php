<?php
    include('../master/connect.php');

$id = $_POST['id'];
$name = trim($_POST['name']);
$description = trim($_POST['description']);
$type =($_POST['types']);


  $sql = "UPDATE subcategories SET names=?, description=? ,name=? WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($name,$description,$type,$id));
     
$conn = null;             

echo json_encode($output);
?>    
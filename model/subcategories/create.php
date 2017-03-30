<?php
    include('../master/connect.php');

$name = trim($_POST['name']);
$description = trim($_POST['description']);


$type = ($_POST['types']);

$id = uniqid('cat');

  $sql = "INSERT INTO subcategories values(?,?,?,?,?)";
  $q = $conn->prepare($sql);
  $q -> execute(array($id,$name,$description,$type,'active'));
     

$conn = null;             

echo json_encode($output);
?>    
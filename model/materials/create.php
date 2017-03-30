<?php
    include('../master/connect.php');

$name = trim($_POST['name']);
$description = trim($_POST['description']);

$id = uniqid('cat');

  $sql = "INSERT INTO equipment values(?,?,?,?)";
  $q = $conn->prepare($sql);
  $q -> execute(array($id,$name,$description,'active'));
     

$conn = null;             

echo json_encode($output);
?>    
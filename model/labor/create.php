<?php
    include('../master/connect.php');

$name = trim($_POST['job']);
$type = trim($_POST['type']);
$unit = trim($_POST['unit']);
$rate = trim($_POST['rate']);


$id = uniqid('lab-');

  $sql = "INSERT INTO labor values(?,?,?,?,?,?)";
  $q = $conn->prepare($sql);
  $q -> execute(array($id,$name,$type,$unit,$rate,'active'));
     

$conn = null;             

echo json_encode($output);
?>    
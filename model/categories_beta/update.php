<?php
    include('../master/connect.php');

$id = $_POST['id'];
$ct_name = trim($_POST['ct_name']);


  $sql = "UPDATE categories_beta SET ct_name=? WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($ct_name,$id));
     
$conn = null;             

echo json_encode($output);
?>    
<?php
    include('../master/connect.php');

$id = $_POST['id'];
$name = trim($_POST['name']);
$names = trim($_POST['names']);
$material_desc = trim($_POST['material_desc']);
$unit = trim($_POST['unit']);
$rate = trim($_POST['rate']);




  $sql = "UPDATE materials SET name=?, names=?, material_desc=?, unit=?, rate=? WHERE id = ?";
  $q = $conn->prepare($sql);
  $q -> execute(array($name,$names,$material_desc,$unit,$rate,$id));
     
$conn = null;             

echo json_encode($output);
?>    
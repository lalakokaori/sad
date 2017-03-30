<?php
    include('../master/connect.php');

$id = $_POST['id'];
$name = trim($_POST['job']);
$type = trim($_POST['type']);
$unit = trim($_POST['unit']);
$rate = trim($_POST['rate']);


  $sql = "UPDATE labor SET labor_desc=?, labor_type=?, uom=?, rate=?  WHERE labor_id = ?"; 
  $q -> execute(array($name,$type,$unit,$rate,$id));
     
$conn = null;             

echo json_encode($output);
?>    
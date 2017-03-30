<?php
    include('../master/connect.php');

$ct_name = trim($_POST['ct_name']);

$id = uniqid('cat');
$ref_id = trim($_POST['ref_id']);
  $sql = "INSERT INTO categories_beta values(?,?,?,?)";
  $q = $conn->prepare($sql);
  $q -> execute(array($id,$ref_id,$ct_name,'active'));
     

$conn = null;             
	
echo json_encode($output);
?>    
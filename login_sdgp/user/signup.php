<?php
include '../connection.php';

$firstname = $_POST["usersFName"];
$lastname = $_POST["usersLName"];
$username = $_POST["usersUId"];
$email = $_POST["usersEmail"];
$pwd = md5($_POST["usersPwd"]);

$sqlQuery = "INSERT INTO users SET usersFName = '$firstname',usersLName ='$lastname',usersUId = '$username',usersEmail = '$email',usersPwd = '$pwd'";

$resultQuery = $connectNow->query($sqlQuery);

if($resultQuery) {
    echo json_encode(array("success"=> true));
} else {
    echo json_encode(array("success"=> false));
}
?>
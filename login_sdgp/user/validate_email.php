<?php

include '../connection.php';

$userEmail = $_POST['usersEmail'];

$sqlQuery = "SELECT * FROM users WHERE usersEmail='$userEmail'";

$resultofQuery = $connectNow->query($sqlQuery);

if ($resultofQuery->num_rows > 0) {
    echo json_encode(array("emailFound"=> true));
} else {
    //user allows to sign up
    echo json_encode(array("emailFound"=> false));
}
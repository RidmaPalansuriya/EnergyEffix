<?php

include '../connection.php';

$userName = $_POST['usersUId'];

$sqlQuery = "SELECT * FROM users WHERE usersUId='$userName'";

$resultofQuery = $connectNow->query($sqlQuery);

if ($resultofQuery->num_rows > 0) {
    echo json_encode(array("usernameFound"=> true));
} else {
    //user allows to sign up
    echo json_encode(array("usernameFound"=> false));
}
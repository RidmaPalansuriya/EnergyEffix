<?php
$serverName= "localhost";
$dbUserName= "sithum";
$dbPassword= "12345678";
$dbName= "energy_effix";

$conn = mysqli_connect($serverName,$dbUserName,$dbPassword,$dbName);

if(!$conn){
    die("Connection Failed :".mysqli_connect_error());
}
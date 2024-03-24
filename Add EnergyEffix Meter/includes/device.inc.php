<?php
if(isset($_POST["submit1"])){ 
    $meterid1 = $_POST["meterid1"];

    require_once("dbh.inc.php");
    require_once("functions.inc.php");

    $emptyInputDevice = emptyInputDevice($meterid1);
    $invalidMeterid = invalidMeterid($meterid1);

    $midExists = midExists($conn, $meterid1);
    
    if($emptyInputDevice !== false){
        header("Location:../device.php?error=emptyinput");
        exit();
    }
    if($invalidMeterid !== false){
        header("Location:../device.php?error=invalidmeterid");
        exit();
    }
    if($midExists !== false){
        header("Location:../device.php?error=meteridtaken");
        exit();
    }

    addDevice($conn, $meterid1);
}
else if(isset($_POST["submit"])){
    $meterid = $_POST["meterid"];

    require_once("dbh.inc.php");
    require_once("functions.inc.php");

    if(emptyinputsLogin($meterid) !== false){
        exit();
    }
    LoginDevice($conn, $meterid);
}
else{
    header("location:../device.php?error=display");
    exit();
}
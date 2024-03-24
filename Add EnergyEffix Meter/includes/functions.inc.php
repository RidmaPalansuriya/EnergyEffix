<?php
function emptyInputDevice($meterid1){
    $result;
    if (empty($meterid1)){
        $result = true;
    }
    else{
        $result = false;
    }
    return $result;
}
function invalidMeterid($meterid1){
    $result;
    if (!preg_match("/^[a-zA-Z0-9]*$/", $meterid1)){
        $result = true;
    }
    else{
        $result = false;
    }
    return $result;
}
function midExists($conn, $meterid1){
    $sql = "SELECT * FROM device WHERE metersId = ?;";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
        header("Location:../device.php?error=stmtfailed");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $meterid1);
    mysqli_stmt_execute($stmt);
    $resultData = mysqli_stmt_get_result($stmt);

    if($row = mysqli_fetch_assoc($resultData)){
        return $row;
    }else{
        return false;
    }

    mysqli_stmt_close($stmt);
}

function addDevice($conn, $meterid1){
    $sql ="INSERT INTO device (metersId) VALUES (?);";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
        header("Location:../device.php?error=stsmtfailed");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $meterid1);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("Location:../device.php?error=none");
    exit();
}
function emptyinputsLogin($meterid){
    $result;
    if (empty($meterid)){
        $result = true;
    }
    else{
        $result = false;
    }
    return $result;
}
function LoginDevice($conn, $meterid){
    $midExists = midExists($conn, $meterid);
    if($midExists === false){
        header("location:../device.php?error=wronglogin");
        exit();
    }else if($meterid === true){
        session_start();
        $_SESSION["metersid"] = $midExists["metersId"];
        header("Location:../index.php");
        exit();
    }
}

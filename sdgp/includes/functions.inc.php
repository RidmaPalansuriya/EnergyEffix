<?php

function emptyInputSignup($firstname,$lastname,$email,$username,$pwd,$pwdRepeat){
    $result;
    if (empty($firstname) || empty($lastname) || empty($email) || empty($username) || empty($pwd) || empty($pwdRepeat)){
        $result = true;
    } else{
        $result = false;
    }
    return $result;
}

function invalidUid($username){
    $result;
    if (!preg_match("/^[a-zA-Z0-9]*$/",$username)){
        $result = true;
    } else{
        $result = false;
    }
    return $result;
}

function invalidEmail($email){
    $result;
    if (!filter_var($email,FILTER_VALIDATE_EMAIL)){
        $result = true;
    } else{
        $result = false;
    }
    return $result;
}

function pwdMatch($pwd,$pwdRepeat){
    $result;
    if ($pwd !== $pwdRepeat) {
        $result = true;
    } else{
        $result = false;
    }
    return $result;
}

function uidExists($conn,$username,$email) {
    $sql = "SELECT * FROM users WHERE usersUId = ? OR usersEmail = ?; ";
    $stmt = mysqli_stmt_init($conn);
    
    if (!mysqli_stmt_prepare($stmt,$sql)) {
        header("Location:../signup.php?error=stmtfailed");
        exit();
    }
    mysqli_stmt_bind_param($stmt, "ss",$username,$email);
    mysqli_stmt_execute($stmt);
    $resultData = mysqli_stmt_get_result($stmt);

    if ($row = mysqli_fetch_assoc($resultData)) {
        return $row;
    }
    else{
        return false;
    }
    mysqli_stmt_close($stmt);
}

    function createUser($conn,$firstname,$lastname,$email,$username,$pwd){
        $sql = "INSERT INTO users (usersFName,usersLName,usersEmail,usersUId,usersPwd) VALUES (?,?,?,?,?);";
        $stmt = mysqli_stmt_init($conn);
    
    if (!mysqli_stmt_prepare($stmt,$sql)) {
        header("Location:../signup.php?error=stmtfailed");
        exit();
    }
    $hashedPwd = password_hash($pwd,PASSWORD_DEFAULT);
    mysqli_stmt_bind_param($stmt,"sssss",$firstname,$lastname,$email,$username,$hashedPwd);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header('Location:../login.php?error=none');
    exit();
}


function emptyInputLogin($username,$pwd){
    $result;
    if (empty($username) || empty($pwd)){
        $result = true;
    } else{
        $result = false;
    }
    return $result;
}

function LoginUser($conn,$username,$pwd) {
    $uidExists = uidExists($conn,$username,$username);
    if($uidExists === false) {
        header('Location:../signup.php?error=wronglogin');
        exit();
    }
    $pwdHashed = $uidExists['usersPwd'];
    $checkPwd = password_verify($pwd,$pwdHashed);

    if ($checkPwd === false) {
        //echo implode("",uidExists);
        header("Location:../signup.php?error=wronglogin1");
        exit();
    } else if ($checkPwd === true) {
        session_start();
        $_SESSION["userid"] = $uidExists["usersId"];
        $_SESSION["useruid"] = $uidExists["usersUId"];
        $_SESSION["userfname"] = $uidExists["usersFName"];
        $_SESSION["userlname"] = $uidExists["usersLName"];
        header("Location:../index.php");
        exit();
    }
}



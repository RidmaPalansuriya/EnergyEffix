<?php
if(isset($_POST["submit"])){
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $username = $_POST["uid"];
    $email = $_POST["email"];
    $pwd = $_POST["pwd"];
    $pwdRepeat = $_POST["pwdrepeat"];

    require_once 'dbh.inc.php';
    require_once 'functions.inc.php';

    $emptyInput = emptyInputSignup($firstname,$lastname,$email,$username,$pwd,$pwdRepeat);
    $invalidUid = invalidUid($username);
    $invalidEmail = invalidEmail($email);
    $pwdMatch = pwdMatch($pwd,$pwdRepeat);
    $uidExists = uidExists($conn,$username,$email);

    if($emptyInput !== false){
        header('location:../signup.php?error=emptyinput');
        exit();
    }
    if($invalidUid  !== false){
        header('location:../signup.php?error=invaliduid');
        exit();
    }
    if($invalidEmail !== false){
        header('location:../signup.php?error=invalidemail');
        exit();
    }
    if($pwdMatch !== false){
        header('location:../signup.php?error=passwordsdontmatch');
        exit();
    }
    if($uidExists !== false){
        header('location:../signup.php?error=usernametaken');
        exit();
    }

    createUser($conn,$firstname,$lastname,$email,$username,$pwd);

}
else{
    header('Location:../login.php');
    exit();
}
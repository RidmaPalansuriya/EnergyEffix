<?php
    include_once 'header.php'
?>
        <h1>Hello! <?php
        if (isset($_SESSION["meterid"])){
            echo $_SESSION["meterid"] . ' !';
            header("location:../index.php");
        }else{
            echo 'user !';
        }
    
    ?>
    </h1>
        <p>Welcome to EnergyEffix Smart Meter</p>
<?php
    include_once 'footer.php'
?>
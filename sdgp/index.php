<?php
    include("header.php")
?>
    <h1 style="text-align:center">Welcome To Our Energy Effix Project<br> <?php 
    if (isset($_SESSION["userfname"])) {
    echo $_SESSION["userfname"] ." ". $_SESSION["userlname"].' !' ; 
    } else {
        echo 'user !';
    }
    
    ?></h1>
    
    
<?php
    include("footer.php")
?>
        
    

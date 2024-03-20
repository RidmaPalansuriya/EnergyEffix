<?php
    include("header.php")
?>
<div class="form">
    <h1>Energy Effix</h1>
<form action="includes/login.inc.php" method="post">

    <input type="text" id="fname" name="uid" placeholder="Email/Username">
    <input type="password" id="lname" name="pwd" placeholder="Password">
    <button name="submit" type="submit">Login</button>
</form>

<p>New Here ? <a href="signup.php">Rejister </a> </p>

</div>
<?php
    include("footer.php")
?>
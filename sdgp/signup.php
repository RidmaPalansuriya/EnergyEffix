<?php
    include("header.php")
?>
<div class="form">
    <h1>Energy Effix</h1>
<form action="includes/signup.inc.php" method="post">

    <input type="text" id="fname" name="firstname" placeholder="First Name">
    <input type="text" id="lname" name="lastname" placeholder="Last Name">
    <input type="text" id="fname" name="email" placeholder="Email">
    <input type="text" id="fname" name="uid" placeholder="Username">
    <input type="password" id="lname" name="pwd" placeholder="Password">
    <input type="password" id="fname" name="pwdrepeat" placeholder="Confirm Password">
    <button name="submit" type="submit">Rejister</button>
</form>
<p>Already have an account? <a href="login.php">Login</a></p>
</div>
<?php
    include("footer.php")
?>
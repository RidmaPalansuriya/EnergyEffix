<?php
    include_once 'header.php'
?>
    <div class="form">
        <h1 style="text-align: center">Add EnergyEffix Meter</h1>
        <form action="includes/device.inc.php" method="post">
            <label for="meterid1">Meter Add to the DataBase</label>
            <input type="text" id="meterid1" name="meterid1" placeholder="Meter Add to the database">
            <button name="submit1" type="submit">Add Meter to database</button>

            <label for="meterid">Meter ID</label>
            <input type="text" id="meterid" name="meterid" placeholder="Eneter Meter ID">
            <button name="submit" type="submit">Add Meter</button>
        </form>
        <div class="form-check" style="text-align: center">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">
            <label class="form-check-label" for="flexCheckIndeterminate">Allow access to the Smart Meter</label>
        </div>
    </div>
<?php
    include_once 'footer.php'
?>
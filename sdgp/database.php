q<?php
$servername = "localhost";
$username = "root"; // MySQL username
$password = "";     // MySQL password
$database = "energy_effix"; // MySQL database name

// Create connection
$conn = mysqli_connect($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " .mysqli_connect_error());
}
echo "Database connection is ok."."<br>";

//Check if the data is recieved or not
if(isset($_POST["voltage"]) && isset($_POST["current"]) && isset($_POST["power"]) && isset($_POST["unit"])){

//inserting the data to the database
$sql = "INSERT INTO esp_32_data (voltage, current, power, unit) VALUES ('.$voltage', '.$current', '.$power', '.$units')";

// Get data from HTTP POST request
$voltage = $_POST['voltage'];
$current = $_POST['current'];
$power = $_POST['power'];
$units = $_POST['units'];

    //Check data installation
    if (mysqli_query($conn, $sql)){
        echo "New record created successfully";
    }else {
        echo "Error :". $sql. "<br>" . mysqli_error($conn);
    }
}
?>

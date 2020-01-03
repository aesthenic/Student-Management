<?php

//$conn = mysqli_connect("localhost", "root", "root", "users");

//$conn = mysqli_connect("localhost", "root", "", "stdmgmtdb");

//echo "test";


//$servername = "192.168.1.161";
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "stdmgmtdb";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

?>

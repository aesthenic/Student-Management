/*
 This page creates a new professor account
*/
<?php


if ($_SERVER['REQUEST_METHOD'] =='POST'){

    $name = $_POST['username'];
    $email = $_POST['email'];
    $pwd = $_POST['password'];

/*
    echo $name = "Student 1";
    echo $email = "std1@gmail.com";
    echo $pwd = "std1";
*/
    //Hash value for the password
    $pwd = password_hash($pwd, PASSWORD_DEFAULT);

    //$pwd = SHA1($pwd);

    require_once 'connect.php';


    // Check that the account does not exist SyncEvent
    $sql = "SELECT * FROM professor WHERE emailProf='$email' ";

    $response = mysqli_query($conn, $sql);


    // Declaring arrays
    //$result = array();
    //$result['login'] = array();

    if ( mysqli_num_rows($response) == 1 ) {
      // The account exist, we cannot create it
      $result["success"] = "0";
      $result["message"] = "error";

      echo json_encode($result);
      mysqli_close($conn);

    } else{
      // The account does not exist yet. We can create it

    //$sql = "INSERT INTO users_table (name, email, password) VALUES ('$name', '$email', '$password')";
    //$sql = "SELECT * FROM student";
    $sql = "INSERT INTO professor (nameProf, emailProf, pswdProf) VALUES ('$name', '$email', '$pwd')";
            //$sql = "INSERT INTO `student` (`idStd`, `nameStd`, `emailStd`, `pswdStd`, `timeStamp`) VALUES (DEFAULT, '$name', '$email', '$pwd', DEFAULT)";


    if ( mysqli_query($conn, $sql) ) {
        $result["success"] = "1";
        $result["message"] = "success";

        echo json_encode($result);
        mysqli_close($conn);

    } else {

        $result["success"] = "0";
        $result["message"] = "error";

        echo json_encode($result);
        mysqli_close($conn);
    }


}

}

?>
<?php
//echo "Test is working";
?>

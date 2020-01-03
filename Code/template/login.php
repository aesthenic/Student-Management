/*
 This page Checks a student or a professor credentials then allow them to access their home page upon login
*/
<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {

    $email = $_POST['email'];
    $pwd = $_POST['password'];

  // $email ="std2@gmail.com";
  //  $pwd = "std2";

    require_once 'connect.php';

    //$sql = "SELECT * FROM users_table WHERE email='$email' ";
    $sql = "SELECT * FROM student WHERE emailStd='$email' ";

    $response = mysqli_query($conn, $sql);


    // Declaring arrays
    $result = array();
    $result['login'] = array();

    // Check first if the input email and password entered are part of the students
    if ( mysqli_num_rows($response) == 1 ) {

        $row = mysqli_fetch_assoc($response);

        // compre thehashed password in the database with the hash value entered by the user
        //if ( password_verify($pwd, "d1d3a3fa62f791de49d453cb36f4e89459960976") ) {
            if ( password_verify($pwd, $row['pswdStd']) ) {

/*
            $index['name'] = $row['name'];
            $index['email'] = $row['email'];
            $index['id'] = $row['id'];
*/
            $index['idSession'] = $row['idStd'];
            $index['nameSession'] = $row['nameStd'];
            $index['emailSession'] = $row['emailStd'];
            // Student account type
            $index['typeAccount'] = "Std";


            array_push($result['login'], $index);

            $result['success'] = "1";
            $result['message'] = "success";
            echo json_encode($result);

            mysqli_close($conn);

        } else {

            $result['success'] = "0";
            $result['message'] = "error";
            echo json_encode($result);

            mysqli_close($conn);

        }

    } else { // If the email and password entered are part of the professors


      require_once 'connect.php';

      //$sql = "SELECT * FROM users_table WHERE email='$email' ";
      $sql = "SELECT * FROM professor WHERE emailProf='$email' ";

      $response = mysqli_query($conn, $sql);


      // Declaring arrays
      $result = array();
      $result['login'] = array();

      if ( mysqli_num_rows($response) == 1 ) {

          $row = mysqli_fetch_assoc($response);

          // compre thehashed password in the database with the hash value entered by the user
          //if ( password_verify($pwd, "d1d3a3fa62f791de49d453cb36f4e89459960976") ) {

      if ( password_verify($pwd, $row['pswdProf']) ) {

/*
      $index['name'] = $row['name'];
      $index['email'] = $row['email'];
      $index['id'] = $row['id'];
*/
      $index['idSession'] = $row['idProf'];
      $index['nameSession'] = $row['nameProf'];
      $index['emailSession'] = $row['emailProf'];
      // Prof account type
      $index['typeAccount'] = "Prof";


      array_push($result['login'], $index);

      $result['success'] = "1";
      $result['message'] = "success";
      echo json_encode($result);

      mysqli_close($conn);

  } else {

      $result['success'] = "0";
      $result['message'] = "error";
      echo json_encode($result);

      mysqli_close($conn);

  }

}
}

}

?>

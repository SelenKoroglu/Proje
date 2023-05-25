<?php
    $day = 0;
    $month = 0;
    $year = 0;
    $name = "";
    $surname = "";
    $email="";
    $registerError = "";
  /*if( isset($_POST["register"]))
  {        
        $name = filter_var($_POST["name"],FILTER_SANITIZE_SPECIAL_CHARS);
        $surname = filter_var($_POST["surname"],FILTER_SANITIZE_SPECIAL_CHARS);
        if (!preg_match("/^[a-zA-Z]{1,}$/",$name)) {
            $registerError .= "Name should consist of letters."; 
        }
        if (!preg_match("/^[a-zA-Z]{1,}$/",$surname)) {
            $registerError .= "<br>Surname should consist of letters."; 
        }
        $email = filter_var($_POST["email"],FILTER_SANITIZE_SPECIAL_CHARS);
        if(!filter_var($email, FILTER_VALIDATE_EMAIL))
        {
            $registerError .= "<br>Email is invalid.";
        }
        $day = $_POST["day"];
        $month = $_POST["month"];
        $year = $_POST["year"];
        if($day  == 0 || $month == 0 || $year == 0)
        {
            $registerError .= "<br>Birthday is invalid.";
        }
        $bdate = $_POST["year"] . "-" . $_POST["month"] . "-" . $_POST["day"];
        if(!isset($_POST["gender"]))
        {
            $registerError .= "<br>Select a gender.";
        }
        else
        {
            $gender = $_POST["gender"];
        }
        $pass = $_POST["pass"];
        if(strlen($pass) < 4)
        {
            $registerError .= "<br>Password should consist of at least 4 characters.";
        }
       
       if($registerError == "")
        {
            
            require_once './Helpers/ImageManager.php';
            $result = ImageManager::ProcessInputImage("p_image", "images/profile/");
            if($result["error"] == 0 || $result["error"] == 1)//succesfully uploaded or not selected an image
            {
                $result["filepath"] = $result["error"] == 0 ? $result["filepath"] : ImageManager::GetDefaultProfilePath();
                $pass = password_hash($pass, PASSWORD_BCRYPT) ;
                $date=date("Y-m-d",strtotime($bdate));
                try {
                    require_once './Helpers/_db.php';
                    $stmt = $db->prepare("insert into user (name, surname, email, bdate, gender, pass, profile_photo) values (?,?,?,?,?,?,?)") ;
                    $stmt->execute( [$name, $surname, $email, $date, $gender, $pass, $result["filepath"]]) ;
                    header("Location: index.php?newUser");
                    exit ;
                } catch (Exception $ex) {
                   $error = true ;
                }  
            }
            else
            {                
                $registerError .= ImageManager::GetErrorString($result["error"]);
            }
        }
  }*/
?>
<!DOCTYPE html>
<html>
<head>
  <title>FaceClone</title>

  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.php">FaceClone</a>
      </div>
    </div>
  </nav>
  <!-- ./nav -->

  <!-- main -->
  <main class="container">
  <h1 class="text-center">Welcome to FaceClone! <br><small>A simple Facebook clone.</small></h1>

    <div class="row">
      <div class="col-md-6">
        <!-- login form -->
        
        <!-- ./login form -->
      </div>
      <div class="col-md-6">
        <h4>Don't have an account yet? I dont care!</h4>

        <!-- register form -->
        <form method="post" action="profile.php">
          <div class="form-group">
            <input class="form-control" type="text" name="email" placeholder="email">
          </div>

          <div class="form-group">
            <input class="form-control" type="text" name="name" placeholder="name">
          </div>

          <div class="form-group">
            <input class="form-control" type="text" name="surname" placeholder="surname">
          </div>

          <div class="form-group">
            <input class="form-control" type="password" name="password" placeholder="Password">
          </div>
        
          <form method="post" action="process_form.php">
            <div class="form-group">
                <p>Select Birthday</p>
                <label for="day">Day:</label>
                <select class="form-control" name="day" id="day">
                    <option value="0">Day</option>
                    <?php
                    for ($i = 1; $i <= 31; $i++) {
                        echo '<option value="' . $i . '">' . $i . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="month">Month:</label>
                <select class="form-control" name="month" id="month">
                    <option value="0">Month</option>
                    <?php
                    for ($i = 1; $i <= 12; $i++) {
                        echo '<option value="' . $i . '">' . $i . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="year">Year:</label>
                <select class="form-control" name="year" id="year">
                    <option value="0">Year</option>
                    <?php
                    $currentYear = date('Y');
                    for ($i = $currentYear; $i >= 1900; $i--) {
                        echo '<option value="' . $i . '">' . $i . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div> 
            <p>Profile Picture:</p>
            <input type="file" name="profile" placeholder="Profile Image">
          </div>
          <div class="form-group">
            <input class="btn btn-success" type="submit" name="register" value="Register">
          </div>
        </form>
        <!-- ./register form -->
      </div>
    </div>
  </main>
  <!-- ./main -->

  <!-- footer -->
  <footer class="container text-center">
    <ul class="nav nav-pills pull-right">
      <li>FaceClone - Made by [your name here]</li>
    </ul>
  </footer>
  <!-- ./footer -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
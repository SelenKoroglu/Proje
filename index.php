<!DOCTYPE html>
<html>
<head>
  <title>FaceClone</title>

  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
  <!-- nav -->
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
        <h4>Login to start enjoying unlimited fun!</h4>

        <!-- login form -->
        <form method="post" action="home.php">
          <div class="form-group">
            <input class="form-control" type="text" name="Email" placeholder="Email">
          </div>

          <div class="form-group">
            <input class="form-control" type="password" name="password" placeholder="Password">
          </div>

          <div class="form-group">
            <input class="btn btn-primary" type="submit" name="login" value="Login">
          </div>
        </form>
        <form method="post" action="signup.php">
        <div class="form-group">
          <p>Don't have an account yet?</p>
          <input class="btn btn-primary" type="submit" name="register" value="Register">
        </div>
      </form>
        <!-- ./login form -->
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
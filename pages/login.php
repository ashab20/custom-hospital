<?php 
session_start();
require_once('../config.php');


if(isset($_SESSION['userdata'])){
    $usr = $_SESSION['userdata'];
}


if(isset($_SESSION['userdata'])){
    // echo $_SESSION['userdata']['roles'];
  if($_SESSION['userdata']['roles']== 'SUPERADMIN'){
    echo "<script> location.replace('$baseurl/dashboard/')</script>";
  }elseif ($_SESSION['userdata']['roles']== 'ADMIN'){
    echo "<script> location.replace('$baseurl/dashboard/patient.php')</script>";
  }elseif ($_SESSION['userdata']['roles']== 'DOCTOR'){
    echo "<script> location.replace('$baseurl/dashboard/doctor.php')</script>";
  }elseif ($_SESSION['userdata']['roles']== 'ASSISTANT'){
    echo "<script> location.replace('$baseurl/dashboard/assistant.php')</script>";
  }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>LOGINL</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../assets/css/style.css">
    <!-- own css -->
    <link rel="stylesheet" href="../assets/css/app.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico" />

    <!-- Jquery -->
    <script src="../assets/js/jquery_3.6.js"></script>
</head>

<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth">
                <div class="row flex-grow">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left p-5">
                            <div class="brand-logo justify-content-center d-flex text-center">
                                <a class=" d-flex text-center text-decoration-none" href="<?=$baseurl?>">
                                    <img src="<?=$baseurl?>assets/images/hospital-sign.png" alt="logo" width="50px"
                                        class="mt-2" style="width: 35px;height:30px" />
                                    <h1 class="pt-2" style="font-weight:bolder;font-size:1.6rem; color:#e01111;">
                                        HOSPITAL</h1>
                                </a>
                            </div>
                            <h4>Hello! let's get started</h4>
                            <h6 class="font-weight-light">Sign in to continue.</h6>
                            <?php 
                  if(isset($_SESSION['msg'])){
                    echo $_SESSION['msg'];
                    unset($_SESSION['msg']);
                  }
                ?>
                            <form class="pt-3" method="POST" action="<?= $baseurl?>form/auth.php">
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control form-control-lg"
                                        id="exampleInputEmail1" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-lg"
                                        id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="mt-3">
                                    <button name="login"
                                        class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn"
                                        href="index.html">SIGN IN</button>
                                </div>
                                <div class="my-2 d-flex justify-content-between align-items-center">
                                    <div class="form-check">
                                        <label class="form-check-label text-muted">
                                            <input type="checkbox" class="form-check-input"> Keep me signed in </label>
                                    </div>
                                    <a href="<?= $baseurl?>pages/register.php" class="auth-link text-black">Create New
                                        Account?</a>
                                </div>
                        </div>
                        </form>
                        <!-- <div class="bg-white text-center">
                            <table class="table">
                                <thead>
                                    <th>Roles</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>SUPERADMIN</td>
                                        <td>superadmin@gmail.com</td>
                                        <td>123456</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div> -->

                    </div>

                </div>
            </div>
        </div>
        <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../assets/js/off-canvas.js"></script>
    <script src="../assets/js/hoverable-collapse.js"></script>
    <script src="../assets/js/misc.js"></script>
    <!-- endinject -->
</body>

</html>s
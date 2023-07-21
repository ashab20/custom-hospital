<?php
    session_start();
    require_once('config.php');

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Appointment</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/images/favicon.png" rel="icon">
    <link href="assets/images/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <script src="<?= $baseurl ?>/assets/js/jquery_3.6.js"></script>

    <!-- Vendor CSS Files -->
    <link href="assets/vendors/frontpage/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/aos/aos.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendors/frontpage/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="./assets/css/frontStyle.css" rel="stylesheet">

</head>

<body>

    <!-- ======= Top Bar ======= -->
    <div id="topbar" class="d-flex align-items-center fixed-top">
        <div class="container d-flex align-items-center justify-content-center justify-content-md-between">
            <div class="align-items-center d-none d-md-flex">
                <i class="bi bi-clock"></i> Monday - Saturday, 8AM to 10PM
            </div>
            <div class="d-flex align-items-center">
                <i class="bi bi-phone"></i> Call us now +1 5589 55488 55
            </div>
        </div>
    </div>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top">
        <div class="container d-flex align-items-center">

            <a href="index.php" class="logo me-auto d-flex">
                <img src="assets/images/hospital-sign.png" alt="logo" width="50px" class="mt-2"
                    style="width: 35px;height:30px" />
                <h1 class="pt-2" style="font-weight:bolder;font-size:1.6rem; color:#e01111;">HOSPITAL</h1>
            </a>


            <nav id="navbar" class="navbar order-last order-lg-0">
                <ul>
                    <li><a class="nav-link scrollto " href="#hero">Home</a></li>
                    <li><a class="nav-link scrollto" href="#about">About</a></li>
                    <li><a class="nav-link scrollto" href="#services">Services</a></li>
                    <li><a class="nav-link scrollto" href="#departments">Departments</a></li>
                    <li><a class="nav-link scrollto" href="#doctors">Doctors</a></li>
                    <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="#">Drop Down 1</a></li>
                            <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i
                                        class="bi bi-chevron-right"></i></a>
                                <ul>
                                    <li><a href="#">Deep Drop Down 1</a></li>
                                    <li><a href="#">Deep Drop Down 2</a></li>
                                    <li><a href="#">Deep Drop Down 3</a></li>
                                    <li><a href="#">Deep Drop Down 4</a></li>
                                    <li><a href="#">Deep Drop Down 5</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Drop Down 2</a></li>
                            <li><a href="#">Drop Down 3</a></li>
                            <li><a href="#">Drop Down 4</a></li>
                        </ul>
                    </li>
                    <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
            <div class="">
                <?php
        if(isset($_SESSION['userdata'])){
          // link
          $link =$user = '';
          if($_SESSION['userdata']){
            $link= 'dashboard/user.php';
          }

          $user = $_SESSION['userdata']['name'];
          }else{
            $user = 'LOGIN';
            $link = 'pages/login.php';
          }
          ?>
                <a href="<?= $baseurl ?>/<?= $link ?>" class="appointment-btn scrollto btn-gradient-primary ">
                    <?= $user ?>
                </a>
            </div>
        </div>
    </header><!-- End Header -->

    <main id="main">
        <!-- *** APPOINTMENT *** -->
        <section id="appointment" class="appointment section-bg" style="margin-top:7rem ;">
            <div class="container" data-aos="fade-up">
                <div class="section-title">
                    <h2>Make an Appointment</h2>
                </div>

                <?php
            // $txt = false;
            // if(isset($_SESSION['appt'])){
            // $txt = $_SESSION['appt'];
            // }

            ?>
                <div class="text-center">

                    <div>
                        <?php
                        require_once('form/appointment.php');
                        ?>
                    </div>
                </div>
                <?php
        require_once('form/appointment.php');

?>



            </div>
        </section>
        <!-- *** End Appointment Section *** -->
    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6">
                        <div class="footer-info">
                            <h3>Medicio</h3>
                            <p>
                                A108 Adam Street <br>
                                NY 535022, USA<br><br>
                                <strong>Phone:</strong> +1 5589 55488 55<br>
                                <strong>Email:</strong> info@example.com<br>
                            </p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Services</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-4 col-md-6 footer-newsletter">
                        <h4>Our Newsletter</h4>
                        <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
                        <form action="" method="post">
                            <input type="email" name="email"><input type="submit" value="Subscribe">
                        </form>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong><span>Medicio</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/medicio-free-bootstrap-theme/ -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    </footer><!-- End Footer -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendors/frontpage/purecounter/purecounter.js"></script>
    <script src="assets/vendors/frontpage/aos/aos.js"></script>
    <script src="assets/vendors/frontpage/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/frontpage/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendors/frontpage/swiper/swiper-bundle.min.js"></script>
    <!-- <script src="assets/vendors/frontpage/php-email-form/validate.js"></script> -->

    <!-- Template Main JS File -->
    <script src="./assets/js/frontMain.js"></script>



</body>

</html>

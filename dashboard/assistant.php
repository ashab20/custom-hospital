<?php
require_once('../lib/Crud.php');
require_once("../include/header.php");

if ($usr['roles'] !== 'ASSISTANT') {
    header("location:$baseurl/dashboard/");
}

?>


<?php
$mysqli = new Crud();
$data = $mysqli->selector('patient', '*', ['created_by'=>$_SESSION['userdata']['id']], 'id', 'DESC');
$patientData = $mysqli->selector('patient', '*');
$admin = $mysqli->counter("user", "roles='PETANT'");
$doctor = $mysqli->counter("user", "roles='DOCTOR'");
$assistant = $mysqli->counter("user", "roles='ASSISTANT'");
// $SUPERSUPERADMIN = $mysqli->selector("user","COUNT(roles='SUPERSUPERADMIN')");

$user = $data['selectdata'];
if ($data['error']) {
    $_SESSION['msg'] = $data['msg'];
    echo "error";
}
?>
<div class="container-scroller">
    <!-- partial:./navbar.php -->
    <?php
    require_once('../include/navbar.php');
    ?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:include/sidebar.php -->
        <?php require_once('../include/sidebar.php') ?>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <!-- page header start -->
                <div class="page-header">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-home"></i>
                        </span> Dashboard
                    </h3>
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item active" aria-current="page">
                                <span></span>Overview <i
                                    class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- header contant -->
                <div class="row">
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-danger card-img-holder text-white">
                            <a href="<?= $baseurl ?>/dashboard/user.php"
                                class="card-body text-white text-decoration-none">
                                <!-- <img src="../assets/images/svg/all.svg" class="card-img-absolute" alt="circle-image"/> -->
                                <h4 class="font-weight-normal mb-3">All User <i
                                        class="mdi mdi-chart-line mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5"><?= $data['numrows'] ?></h2>
                                <!-- <h6 class="card-text">Increased by 60%</h6> -->
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-info card-img-holder ">
                            <a href="<?= $baseurl ?>/dashboard/patient.php"
                                class="card-body text-white text-decoration-none">
                                <img src="../assets/images/doctors/patient.svg" class="card-img-absolute"
                                    alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Patient <i
                                        class="mdi mdi-bookmark-outline mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5"><?= $patientData['numrows']; ?></h2>
                                <!-- <h6 class="card-text">Decreased by 10%</h6> -->
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-success card-img-holder text-white">
                            <a href="<?= $baseurl ?>/dashboard/doctor.php"
                                class="card-body  text-white text-decoration-none">
                                <img src="../assets/images/doctors/doctor.svg" class="card-img-absolute"
                                    alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Doctors <i
                                        class="mdi mdi-diamond mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5"><?= $doctor['count'][0] ?></h2>
                                <h6 class="card-text">Increased by 5%</h6>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-4 stretch-card grid-margin">
                        <div class="card bg-gradient-dark card-img-holder text-white">
                            <a href="#" class="card-body text-white text-decoration-none">
                                <img src="../assets/images/doctors/nurse.svg" class="card-img-absolute"
                                    alt="circle-image" />
                                <h4 class="font-weight-normal mb-3">Assistant <i
                                        class="mdi mdi-chart-line mdi-24px float-right"></i>
                                </h4>
                                <h2 class="mb-5"><?= $assistant['count'][0] ?></h2>
                                <!-- <h6 class="card-text">Increased by 60%</h6> -->
                            </a>
                        </div>
                    </div>
                </div>
                <!-- header contant -->

                <!-- Hospital Managment -->

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h4>Hospitalize</h4>
                                    <span
                                        style="background-color: aliceblue;border-radius: 100%;text-align: center;justify-content: center;align-items: center;display: flex;width: 1.5rem;height: 1.5rem;cursor:pointer;">
                                        <i class="mdi mdi-chevron-down"
                                            onclick="$('#patientctl').toggleClass('d-none')"></i></span>
                                </div>
                                <hr />
                                <div class="row" id="patientctl">
                                    <div class="col-3 offset-3" class="d-flex justify-content-center">
                                        <a href="<?= $baseurl ?>/pages/patient.php"
                                            class="p-4 text-decoration-none text-center text-muted d-flex flex-column align-items-center justify-content-center">
                                            <img src="../assets/images/icons/patient.png" height="80px" width="80px"
                                                alt="">
                                            <h5 class="py-4">Add Patient</h5>
                                        </a>
                                    </div>
                                    <div class="col-3" class="d-flex justify-content-center">
                                        <a href=""
                                            class="p-4 text-decoration-none text-center text-muted d-flex flex-column align-items-center justify-content-center">
                                            <img src="../assets/images/icons/deadline.png" height="80px" width="80px"
                                                alt="">
                                            <h5 class="py-4">Make Appointment</h5>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Recent Activities</h4>
                                <div class="table-responsive">
                                    <!-- ! *** TABLE FROM DATABASE *** -->
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th> Id </th>
                                                <th> Name </th>
                                                <th> Phone </th>
                                                <th> Created By </th>
                                                <th> Modified By </th>
                                                <th> Status </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            if ($data['numrows'] > 0) {
                                                foreach ($user as $u) { ?>
                                            <tr>
                                                <td><?= $u['id'] ?></td>
                                                <td>
                                                    <img src="../assets/images/faces/face3.jpg" class="me-2"
                                                        alt="image">
                                                    <?= $u['name'] ?>
                                                </td>
                                                <td><?= $u['phone'] ?></td>
                                                <td>
                                                    You
                                                    <br>
                                                    <?= $u['created_at'] ?>
                                                </td>
                                                <td>
                                                    <?= $u['modified_by'] ?>
                                                    <?= $u['modified_at'] ?>
                                                </td>
                                                <td>
                                                    <?php
                                                            if ($u['status'] == 1) {
                                                                echo "<label class='badge badge-gradient-info'>ACTIVE</label>";
                                                            }
                                                            "<label class='badge badge-gradient-danger'>DEACTIVE</label>";
                                                            ?>
                                                </td>
                                            </tr>
                                            <?php }
                                            } else { ?>
                                            <p>Data not found</p>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:include/footer.php -->
            <?php require_once('../include/footer.php') ?>
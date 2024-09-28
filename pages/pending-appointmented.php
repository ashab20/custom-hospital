<?php
require_once('../lib/Crud.php');
require_once('../include/header.php');


// if(!$_SESSION["userdata"]){
//   echo "<script> location.replace('$baseurl/dashboard/')</script>";
// }


if ($usr) {
    switch ($usr['roles']) {
        case 'DOCTOR':
            header("location:$baseurl/dashboard/");
            break;
        case 'ASSISTANT':
            // header("location:$baseurl/dashboard/");
            break;
    }
} else {
    header("location:$baseurl/pages/login.php");
}




$mysqli = new Crud();

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



                <!-- *************************************************************** -->
                <!-- page header start -->
                <div class="page-header">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-home"></i>
                        </span> Pendding Appointment

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

                <?php

                if ($usr['roles'] == 'PATIENT') {
                    $patientId = $_GET['patientId'];
                    $allPatient = $mysqli->find("SELECT a.*,p.id as patient_id,p.name,p.gender,p.age,u.name as doctor_name, a.name as patient_name
FROM appointment a 
JOIN doctor d ON a.doctor_id=d.id 
left JOIN patient p ON a.patient_id=p.id 
JOIN user u ON u.id=d.user_id WHERE p.id='$patientId' AND a.status=0 ORDER BY a.date DESC
    ");
                } else {
                    // $patientId = $_GET['patientId'];
                    $allPatient = $mysqli->find("SELECT a.*,p.id as patient_id,p.name,p.gender,p.age,u.name as doctor_name, a.name as patient_name
FROM appointment a 
JOIN doctor d ON a.doctor_id=d.id 
left JOIN patient p ON a.patient_id=p.id 
Left JOIN user u ON u.id=d.user_id
WHERE a.status=0
ORDER BY a.date DESC
    ");
                }

                $patient = $allPatient["singledata"];
                ?>
                <?php if (isset($_SESSION["msg"])) { ?>
                <div class="bg-light p-4">
                    <h4 class="text-info text-center">
                        <?= $_SESSION["msg"]; ?>
                    </h4>
                </div>
                <?php unset($_SESSION["msg"]);
                } ?>
                <?php
                // ! CONDITION END @:ADD PATIENT

                $id = $usr['id'];
                // ! * PATIENT ADDED BY THIS ADMIN *



                ?>

                <div class="row mt-5" id="created_at">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">

                                <div class="d-flex justify-content-between">
                                    <h4 class="card-title">Pendding Appointment List</h4>
                                    <div class="search d-flex">
                                        <i class="mdi mdi-person-star"></i>
                                        <input type="text" class="form-control" placeholder="Search by name">
                                    </div>
                                    <a href="<?= $baseurl ?>/dashboard/patient.php"
                                        class="btn btn-secondary text-white font-weight-bold text-decoration-none">
                                        Pendding Appointment List
                                    </a>
                                </div>
                                <div class="table-responsive mt-3">
                                    <!-- ! * TABLE FROM DATABASE * -->
                                    <table class="table table-hover table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th> Id </th>
                                                <th> Name</th>
                                                <th> Phone </th>
                                                <th> Gender </th>
                                                <th> Doctor Name </th>
                                                <th> Time </th>
                                                <th> Action </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                                            $l = 0;
                                            if ($allPatient['numrows'] > 0) {
                                                foreach ($patient as $p) {
                                                    if ($p['status'] == 0) {
                                            ?>
                                            <tr>
                                                <td><?= ++$l ?>
                                                    <input type="text" hidden value="<?= $p['id'] ?>" id="pid">
                                                </td>
                                                <td>
                                                    <a class="btn" title="View Profile"
                                                        href="<?= $baseurl ?>/pages/profile.php?patientid=<?= $p['id'] ?>">
                                                        <?= $p['name'] ?? $p['patient_name'] ?>
                                                    </a>
                                                </td>
                                                <td><?= $p['phone'] ?></td>
                                                <td><?= $p['gender'] ?? $p['gender'] ?></td>
                                                <td>
                                                    <?= $p["doctor_name"] ?>
                                                </td>
                                                <td>
                                                    <?= $p["time"] ?> <br><br>
                                                    <?php $d = explode("-", $p["date"]);
                                                                echo $d[2] . "/" . $d[1] . "/" . $d[0]; ?>
                                                </td>
                                                <td>
                                                    <?php
                                                                if ($p['status'] == 0) {
                                                                ?>
                                                    <a title="Cancel" onclick=" return myConfirm();"
                                                        href="<?= $baseurl ?>/form/action.php?apptId=<?= $p['id'] ?>"
                                                        <span class="badge badge-success">Approve?</span>
                                                    </a>
                                                    <?php } ?>
                                                </td>

                                            </tr>
                                            <?php }
                                                }
                                            } else { ?>
                                            <tr>
                                                <td colspan="5">No Data Found</td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php

                ?>


                <!-- * END THIS ADMIN*** -->

            </div>

            <!-- content-wrapper ends -->
            <!-- partial:include/footer.php -->
            <?php require_once('../include/footer.php') ?>

            <script>
            $('#released').click(() => {
                let pid = $("#pid").val();
                location.replace("./invoice.php?patientid=" + pid);

            })

            function myConfirm() {
                if (confirm("Do you want to Approve?")) {
                    return true;
                } else {
                    return false;
                }
            }
            </script>
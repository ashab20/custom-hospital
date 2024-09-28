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
if (isset($_GET['patientId'])) {
    $patientId = $_GET['patientId'];
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
                <!-- ***************************************************************** -->
                <!-- page header start -->
                <div class="page-header">
                    <h3 class="page-title">
                        <span class="page-title-icon bg-gradient-primary text-white me-2">
                            <i class="mdi mdi-home"></i>
                        </span> Patient

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
                if (isset($_GET['patientId'])) {
                    $patientId = $_GET['patientId'];
                    $patientData = $mysqli->find("SELECT * FROM patient WHERE id=$patientId limit 1");
                    $patient = $patientData["singledata"][0];
                }
                ?>
                <?php
                // ! CONDITION END @:ADD PATIENT
                $id = $usr['id'];
                // ! *** PATIENT ADDED BY THIS ADMIN ***

                ?>

                <div class="row mt-5" id="created_at">
                    <div class="col-12 grid-margin">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <h4 class="card-title">Update Patientt</h4>
                                    <a href="<?= $baseurl ?>/pages/allpatient.php"
                                        class="btn btn-secondary text-white font-weight-bold text-decoration-none">
                                        Patient List
                                    </a>
                                </div>
                                <form class=" justify-content-center items-center" method="POST"
                                    action="<?= $baseurl ?>/form/action.php?id=<?= $patientId ?>">
                                    <div class="form-row d-flex">
                                        <input type="text" name="patientId" value="<?= $patientId ?>" hidden>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="name">Name</label>
                                            <input type="text" name="name" value="<?= $patient['name'] ?>"
                                                class="form-control" id="name" placeholder="Name">
                                        </div>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="gender">Gender</label>
                                            <select name="gender" class="form-control" id="gender">
                                                <option value="">Select Gender</option>
                                                <option <?= $patient['gender'] == 'male' ? 'selected' : '' ?>
                                                    value="male">Male</option>
                                                <option <?= $patient['gender'] == 'female' ? 'selected' : '' ?>
                                                    value="female">Female</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="age">Age</label>
                                            <input type="number" maxlength="3" name="age" value="<?= $patient['age'] ?>"
                                                class="form-control" id="age" placeholder="age">
                                        </div>
                                    </div>

                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="phone">Father's Name:</label>
                                            <input type="text" name="father_or_husband_name"
                                                value="<?= $patient['father_or_husband_name'] ?>" class="form-control"
                                                id="phone" placeholder="Father or Husband Name">
                                        </div>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="inputAddress">Mother's Name:</label>
                                            <input type="text" name="mother_name" value="<?= $patient['mother_name'] ?>"
                                                class="form-control" id="inputAddress" placeholder="Mother Name">
                                        </div>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="phone">Phone</label>
                                            <input type="tel" maxlength="12" name="phone"
                                                value="<?= $patient['phone'] ?>" class="form-control" id="phone"
                                                placeholder="Phone">
                                        </div>
                                    </div>

                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="inputAddress">Address</label>
                                            <input type="text" name="present_address"
                                                value="<?= $patient['present_address'] ?>" class="form-control"
                                                id="inputAddress" placeholder="1234 Main St">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary"
                                            name="updateDataPatient">Update</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- *** END THIS p*** -->
            </div>

            <!-- content-wrapper ends -->
            <!-- partial:include/footer.php -->
            <?php require_once('../include/footer.php') ?>
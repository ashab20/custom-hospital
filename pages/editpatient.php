<?php
require_once('../lib/Crud.php');
require_once('../include/header.php');


// if(!$_SESSION["userdata"]){
//   echo "<script> location.replace('$baseurl/dashboard/')</script>";
// }


if($usr){
switch ($usr['roles']) {
  case 'DOCTOR':
    header("location:$baseurl/dashboard/");
    break;
  case 'ASSISTANT':
    // header("location:$baseurl/dashboard/");
    break;
  }
}else{
  header("location:$baseurl/pages/login.php");
}
if(isset($_GET['patientId'])){
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
                <!-- *************************************************************** -->
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
if(isset($_GET['patientId'])){
    $patientId = $_GET['patientId'];
    $patientData = $mysqli->find("SELECT * FROM patient WHERE id=$patientId");
    $patient = $patientData["singledata"][0];
    //print_r($patient);
}
?>
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
                                    <h4 class="card-title">Update Patientt</h4>
                                    <a href="<?=$baseurl ?>/pages/allpatient.php"
                                        class="btn btn-secondary text-white font-weight-bold text-decoration-none">
                                        Patient List
                                    </a>
                                </div>
                                <div class="row card-body justify-content-center">
                                    <form class="pt-3 justify-content-center items-center" method="POST"
                                        action="<?=$baseurl?>/form/action.php">
                                        <div class="form-row d-flex">
                                            <div class="form-group col-md-4 mx-2">
                                                <div><label for="guardian_name">Phone:</label><span
                                                        class="float-end text-danger">*</span></div>
                                                <input type="text" minlength="11" maxlength="11" name="phone" required
                                                    class="form-control" id="phone" placeholder="phone">
                                            </div>
                                            <div class="form-group col-md-4 mx-2">
                                                <div><label for="guardian_name">Name:</label><span
                                                        class="float-end text-danger">*</span></div>
                                                <input type="text" name="name" required class="form-control" id="name"
                                                    placeholder="Name">
                                            </div>
                                            <div class="form-group col-md-4 mx-2">
                                                <label for="age">Nid:</label>
                                                <input type="text" name="nid" class="form-control" id="nid"
                                                    placeholder="Nid No">
                                            </div>

                                        </div>
                                        <div class="form-row d-flex">
                                            <div class="form-group col-md-4 mx-2">
                                                <div><label for="guardian_name">Father's Name:</label><span
                                                        class="float-end text-danger">*</span></div>
                                                <input type="text" name="father_or_husband_name" required
                                                    class="form-control" id="father_or_husband_name"
                                                    placeholder="Father/Husband's Name">
                                            </div>
                                            <div class="form-group col-md-4 mx-2">
                                                <label for="mother_name">Mother's Name:</label>
                                                <input type="text" name="mother_name" class="form-control"
                                                    id="mother_name" placeholder="Mother's Name">
                                            </div>
                                            <div class="form-group col-md-4 mx-2">
                                                <label for="phone">Marital Status</label><br>
                                                <div class="justify-item-center mt-2">
                                                    <input type="radio" name="marital_status"
                                                        class="form-check-input mx-1" id="married" value="MARRIED">
                                                    <label for="married" class="form-check-label mt-1">Married</label>
                                                    <input type="radio" name="marital_status"
                                                        class="form-check-input mx-1" value="UNMARRIED" id="Unmarried">
                                                    <label for="Unmarried"
                                                        class="form-check-label mt-1">Unmarried</label>
                                                    <input type="radio" name="marital_status" value="OTHERS"
                                                        class="form-check-input mx-1" id="Others">
                                                    <label for="Others" class="form-check-label mt-1">Others:</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row d-flex">
                                            <div class="form-group col-md-4 mx-2">
                                                <div><label for="guardian_name">Gender:</label><span
                                                        class="float-end text-danger">*</span></div>
                                                <select id="gender" name="gender" class="form-select">
                                                    <option selected>Gender...</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">female</option>
                                                    <option value="other">Other</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-3 mx-2">
                                                <div><label for="guardian_name">Age:</label><span
                                                        class="float-end text-danger">*</span></div>
                                                <input type="text" name="age" required class="form-control" id="age"
                                                    placeholder="eg 35">
                                            </div>
                                            <div class="form-group col-md-3 mx-2">
                                                <label for="address">Blood Group:</label>
                                                <select name="blood_group" id="" class="form-select">
                                                    <option value="">Select Group</option>
                                                    <option value="A+">A+(ve)</option>
                                                    <option value="A-">A-(ve)</option>
                                                    <option value="B+">B+(ve)</option>
                                                    <option value="B-">B-(ve)</option>
                                                    <option value="AB-">AB+(ve)</option>
                                                    <option value="AB-">AB-(ve)</option>
                                                    <option value="O+">O+(ve)</option>
                                                    <option value="O-">O-(ve)</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-row d-flex">
                                            <div class="form-group col-md-5 mx-2">
                                                <div><label for="guardian_name">Present
                                                        Address:</label><span class="float-end text-danger">*</span>
                                                </div>
                                                <textarea name="present_address" class="form-control"
                                                    id="present_address"></textarea>
                                            </div>
                                            <div class="form-group col-md-5 mx-2">
                                                <label for="address">Permanent Address:</label>
                                                <textarea name="permanent_address" class="form-control"
                                                    id="permanent_address"></textarea>
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit" class="btn btn-primary" name="addPatient">Add
                                                Patient</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- * END THIS p*** -->
            </div>

            <!-- content-wrapper ends -->
            <!-- partial:include/footer.php -->
            <?php require_once('../include/footer.php') ?>
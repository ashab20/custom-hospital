<?php 
  require_once('../lib/Crud.php'); 
  require_once('../include/header.php'); 

  $mysqli = new Crud();

  if($usr['roles'] !== 'SUPERADMIN' ){
    header("location:$baseurl/pages/login.php");
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
        <?php require_once('../include/sidebar.php'); ?>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <?php
          $mysqli = new Crud();
          $data = $mysqli->selector('user','*');
          $patient = $mysqli->counter("user","roles='PETANT'");
          $doctor = $mysqli->counter("user","roles='DOCTOR'");
          $employee = $mysqli->counter("user","roles='EMPLOYEE'");
          // $SUPERADMIN = $mysqli->selector("user","COUNT(roles='SUPERADMIN')");

          $user = $data['selectdata'];
          if($data['error']){
            $_SESSION['msg']=$data['msg'];
            echo "error";
          }
        ?>
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

                <div class="row justify-content-center">
                    <!-- Session for Categories -->
                    <?php 
            if(isset($_SESSION['msg'])){
              echo  $_SESSION['msg'];
              unset ($_SESSION['msg']);
            }
          ?>

                    <!-- Department form -->

                    <?php 
            if(isset($_GET['deptId']) && strlen($_GET['deptId']) > 0){
            ?>
                    <div class="col-md-5 grid-margin stretch-card" id="departmentform">
                        <div class="card">
                            <p class="closebtn"> <i class="mdi mdi-close-circle-outline cursor-pointer text-danger"
                                    onclick="$('#test').toggleClass('d-none'); $testBtn.toggleClass('btn-dark');"> </i>
                            </p>

                            <?php
                  $dept_id=$_GET['deptId'];
                  $dept_data=$mysqli->select_single("select * from department where id=$dept_id");
                  $deptartment=$dept_data['singledata'];
                ?>
                            <!-- Department Data -->
                            <h2 class=" text-dark text-center h2">Department</h2>
                            <div class="row ">
                                <div class="col-md-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title text-muted">Update Department</h4>
                                            <!-- edit deprtme -->
                                            <form class="justify-content-center items-center" method="POST"
                                                id="editdeptform" action="<?= $baseurl ?>/form/action.php">
                                                <input type="text" value="<?= $_GET['deptId'] ?>" name="id" hidden>
                                                <div class="form-row col-md-12 d-flex">
                                                    <div class="form-group col-md-6 mx-2">
                                                        <input type="text" value="<?= $deptartment['name'] ?>"
                                                            name="name" required class="form-control" id="name"
                                                            placeholder="Name">
                                                    </div>
                                                    <div class="form-group col-md-6 mx-2">
                                                        <input minlength="11" type="submit" maxlength="11"
                                                            name="update_dept" class="form-control" value="Update">
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php 
              }
            ?>
                    <!-- department end -->

                    <!-- Designation form -->
                    <?php 
            if(isset($_GET['desigId']) && strlen($_GET['desigId']) > 0){ 
            ?>
                    <div class="col-md-7 grid-margin stretch-card" id="designationform">
                        <div class="card">
                            <div class="card-body">

                                <?php 
                    $desi_id=$_GET['desigId'];
                    $desi_data=$mysqli->select_single("select * from designation where id=$desi_id")['singledata'];
                  ?>

                                <h4 class="card-title">Update Designation</h4>
                                <form class="pt-3 justify-content-center items-center" method="POST"
                                    action="<?=$baseurl?>/form/action.php">
                                    <input type="text" name="id" value="<?=$_GET['desigId'] ?>" hidden>
                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="designation_name">Designation Name: </label>
                                            <input type="text" value="<?= $desi_data['designation_name']; ?>"
                                                name="designation_name" required class="form-control"
                                                id="designation_name" placeholder="Designation Name">
                                        </div>
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="base_salary">Basic Salary: </label>
                                            <input type="text" value="<?= $desi_data['base_salary']; ?>"
                                                name="base_salary" required class="form-control" id="base_salary"
                                                placeholder="Basic Salary">
                                        </div>
                                    </div>
                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="bounus_by_percent">Bonus: </label>
                                            <input type="text" value="<?= $desi_data['bounus_by_percent']; ?>"
                                                name="bounus_by_percent" required class="form-control"
                                                id="bounus_by_percent" placeholder="Bonus in percent">
                                        </div>
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="total_bounus">Total Bonus: </label>
                                            <input type="text" value="<?= $desi_data['total_bounus']; ?>"
                                                name="total_bounus" required class="form-control" id="total_bounus"
                                                placeholder="Total Bonus">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary" name="update_degi">Update
                                            Designation</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <?php  }?>

                    </div>
                    <!-- designation end -->

                    <!-- Room form -->

                    <?php 
            if(isset($_GET['roomId']) && strlen($_GET['roomId']) > 0){ ?>
                    <div class="col-md-7 grid-margin stretch-card" id="roomform">
                        <div class="card">
                            <div class="card-body">
                                <?php
                    $room_id=$_GET['roomId'];
                    $room_data=$mysqli->select_single("select * from room where id=$room_id")['singledata'];
                  ?>
                                <h4 class="card-title">Update Room</h4>
                                <form class="pt-3 justify-content-center items-center" method="POST"
                                    action="<?=$baseurl?>/form/action.php">
                                    <input type="text" name="id" value="<?=$_GET['roomId'] ?>" hidden>
                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="floor">Floor: </label>
                                            <input type="text" value="<?= $room_data['floor'] ?>" name="floor" required
                                                class="form-control" id="floor" placeholder="Floor Name">
                                        </div>
                                        <div class="form-group col-md-6 mx-2">
                                            <label for="room_no">Room No: </label>
                                            <input type="text" value="<?= $room_data['room_no'] ?>" minlength="3"
                                                maxlength="11" name="room_no" required class="form-control" id="room_no"
                                                placeholder="Room No">
                                        </div>
                                    </div>
                                    <div class="form-row d-flex">
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="details">Detail: </label>
                                            <input type="text" value="<?= $room_data['details'] ?>" name="details"
                                                class="form-control" id="details" placeholder="Details">
                                        </div>
                                        <div class="form-group col-md-4 mx-2">
                                            <label for="details">Rate: </label>
                                            <input type="text" value="<?= $room_data['rate'] ?>" name="rate"
                                                class="form-control" id="details" placeholder="Rate">
                                        </div>
                                        <div class="form-group col-md-3 mx-2">
                                            <label for="gender">Room Type:</label>
                                            <select id="gender" name="room_type" class="form-control">
                                                <option value="<?= $room_data['room_type'] ?>">
                                                    <?= $room_data['room_type'] ?></option>
                                                <option value="CHAMBER">CHAMBER</option>
                                                <option value="GENERAL-CABIN">GENERAL-CABIN</option>
                                                <option value="VIP-CABIN">VIP-CABIN</option>
                                                <option value="OT">OT</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary" name="update_room">Update
                                            Room</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <?php
              } 
              ?>
                    </div>

                    <!-- Room end -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
let $designationbtn = $('#designationbtn');
let $departmentBtn = $('#departmentBtn');
let $serviceBtn = $('#serviceBtn');
let $roomBtn = $('#roomBtn');
let $rateBtn = $('#rateBtn');
let $closebtn = $('#closebtn');

$departmentBtn.click(function() {
    $('#departmentform').toggleClass('d-none');
    //  $('#addPatientForm').removeClass('d-none');
});



$rateBtn.click(function() {
    $('#rate_form').toggleClass('d-none');
    //  $('#addPatientForm').removeClass('d-none');
});

$closebtn.click(function() {
    $('#departmentform').addClass('d-none');
    $addPatient.removeClass('d-none');
});
$designationbtn.click(function() {
    $('#designationform').toggleClass('d-none');
    // $appointmentBtn.toggleClass('btn-dark');

    // $('#test').addClass('d-none');
    // $testBtn.addClass('btn-outline-dark');
    // $('#admit').addClass('d-none');
    // $admitBtn.addClass('btn-outline-dark');

})
$roomBtn.click(function() {
    $('#roomform').toggleClass('d-none');
    // $testBtn.toggleClass('btn-dark');
})
$serviceBtn.click(function() {
    $('#service_form').toggleClass('d-none');
    // $admitBtn.toggleClass('btn-dark');
})
</script>
<!-- content-wrapper ends -->
<!-- partial:include/footer.php -->
<?php require_once('../include/footer.php'); ?>
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
        case 'PATIENT':
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
                if (isset($_GET['patientId']) && strlen($_GET['patientId']) > 0) {
                    $patient = $_GET['patientId'];
                    $patientSingleData = $mysqli->select_single("SELECT id,name,phone,age,gender from patient where id='$patient'");
                    if ($patientSingleData['numrows'] == 0) {
                        $msg = "<p style='color:red'>NO Patient registered with this phone number.</p>";
                        // echo "<script> location.replace('$baseurl/pages/login.php')</script>";
                    }
                }
                ?>

                <?php require_once('../components/patient/addpatient.php'); ?>
                <!-- ADD PATIENT END -->


                <!-- Conditional -->
                <?php
                    // ! CONDITION START @:SINGLE DATA
                    if (isset($patientSingleData['singledata']) && $patientSingleData['msg'] === 'data found') { ?>

                <!-- ********************************
                    @:APPOINTMENT 
                *********************************-->
                <div class="row mt-1" id="appointment">
                    <div class="col-12 ">
                        <div class="card w-100 mx-auto">


                            <div class="row card-body justify-content-center">

                                <!-- ***** -->
                                <?php
          $departmentData =$mysqli->selector('department','*');
          $department = $departmentData['selectdata'];
          if($departmentData['error']){
            $_SESSION['msg']=$departmentData['msg'];
            echo "error";
          }
          $doctorData =$mysqli->find("SELECT name,id FROM user WHERE roles='DOCTOR'");
          $doctors = $doctorData['singledata'];

          $patient_id = $patientSingleData['singledata']['id'];
      ?>

                                <!-- **** -->

                                <form class=" justify-content-center items-center" method="POST"
                                    action="<?=$baseurl?>/form/action.php">
                                    <input type="text" hidden name="patient_id" value="<?= $patient_id ?>"
                                        id="patient_id">
                                    <input type="text" hidden name="name"
                                        value="<?= $patientSingleData['singledata']['name'] ?>">
                                    <input type="text" hidden name="phone"
                                        value="<?= $patientSingleData['singledata']['phone'] ?>">
                                    <input type="text" hidden name="created_by" value="<?= $usr['id'] ?>">
                                    <div class="form-row d-flex justify-content-center">
                                        <div class="form-group col-md-3 mx-2">
                                            <div><label for="guardian_name">Date:</label><span
                                                    class="float-end text-danger">*</span>
                                            </div>
                                            <input type="date" id="appointmentDate" min="<?=date('Y-m-d') ?>" required
                                                class="form-select p-1" required name="date">
                                        </div>
                                        <div class="form-group col-md-3 mx-2">
                                            <div><label for="guardian_name">Department:</label><span
                                                    class="float-end text-danger">*</span></div>
                                            <select id="department" name="department_id" required class="form-select"
                                                onchange="get_doctor(this.value)">
                                                <option value="">Department...</option>
                                                <?php foreach ($department as $dept){
                if($dept["status"]==1){ ?>
                                                <option value="<?=$dept['id'] ?>"><?= $dept['name']?></option>
                                                <?php } }?>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3 mx-2">
                                            <div><label for="guardian_name">Doctor:</label><span
                                                    class="float-end text-danger">*</span>
                                            </div>
                                            <select id="depdoctor" onchange="get_time(this.value)" name="doctor_id"
                                                class="form-select" required>
                                                <option value="">Doctor...</option>
                                            </select>
                                        </div>



                                    </div>
                                    <div class="form-row d-flex justify-content-center">
                                        <div class="form-group col-md-3 mx-2">
                                            <div><label for="guardian_name">Time:</label><span
                                                    class="float-end text-danger">*</span>
                                            </div>
                                            <input type="text" name="" readonly class="form-control" id="time">
                                        </div>
                                        <div class="form-group col-md-3 mx-2">
                                            <label for="fees">Consultancy Fees:</label>
                                            <input class="form-control m-1" type="text" name="visit_fees" readonly
                                                id='fees'>
                                        </div>
                                        <div class="form-group col-md-3 mx-2">
                                            <label for="fees">Discount(%):</label>
                                            <input class="form-control m-1" type="text" name="discount" id='discount'
                                                onchange="getDiscount(this.value)">
                                            <!-- <input  type="number" hidden id='wdiscount'> -->
                                        </div>
                                    </div>
                                    <div class="form-row d-flex justify-content-center">
                                        <div class="form-group col-md-3 mx-2">
                                            <label for="fees">Total:</label>
                                            <input class="form-control m-1" type="text" name="total" id='total'>
                                        </div>
                                        <div class="form-group col-md-5 ">
                                            <textarea class="form-control" name="message" rows="5"
                                                placeholder="Message (Optional)"></textarea>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center">
                                        <button type="submit" class="btn btn-primary" name="appt">Make
                                            Appointment</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <?php  } ?>

                <?php if (isset($patientSingleData['singledata'])) { ?>
                <?php } ?>


                <script>
                function get_doctor(dep) {

                    $.ajax({
                        url: '../form/data.php?department=' + dep,
                        type: 'post',
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function(data) {
                            $('#depdoctor').html(JSON.stringify(data));
                        },
                        error: function(xhr, status, errorMessage) {}
                    });
                }


                function get_time(shift) {
                    let patientId = $("#patient_id").val();

                    let appointmentDate = $("#appointmentDate").val();
                    if (!appointmentDate) {
                        alert('Please Select Appointment date first!')
                        $('#depdoctor').html("<option>No data</option>");
                        return false
                    }
                    $.ajax({
                        url: '../form/data.php?time=' + shift + '&patientId=' + patientId + '&apptdate=' +
                            appointmentDate,
                        type: 'post',
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function(data) {
                            if (data["status"] == 'success') {
                                $('#time').val(JSON.stringify(data["time"]).trim('"'));
                                $('#limit').text(JSON.stringify(data["time"]).trim('"'));
                                $('#fees').val(JSON.stringify(data['fees']).trim('"') + "tk");
                                $('#discount').val(JSON.stringify(data['discount']).trim('"'));
                                $('#total').val(JSON.stringify(data['total']).trim('"'));
                            } else {
                                alert(data["msg"])
                            }
                        },
                        error: function(xhr, status, errorMessage) {}
                    });
                }

                function getDiscount(discount) {
                    let getTotal = $('#total').val()
                    if (discount !== 0) {
                        let totalpay = getTotal - getTotal * discount / 100;
                        $("#total").val(totalpay);
                    }
                }

                function get_rate(rate) {
                    $.ajax({
                        url: '../form/data.php?time=' + rate,
                        type: 'post',
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function(data) {
                            $('#rate').html(JSON.stringify(data));
                        },
                        error: function(xhr, status, errorMessage) {}
                    });
                }
                </script>
            </div>

            <!-- content-wrapper ends -->
            <!-- partial:include/footer.php -->
            <?php require_once('../include/footer.php') ?>
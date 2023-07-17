<?php 
require_once('../lib/Crud.php');
require_once("../include/header.php");


?>

<div class="container-scroller">

    <!-- partial:./navbar.php -->

    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:include/sidebar.php -->

        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">


                <?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



// session_start();
require_once('../lib/Crud.php'); 

$mysqli = new Crud();

$connect =  new mysqli(HOST,USER,PASS,DB_NAME);
if($connect->connect_error){
    echo $connect->connect_error;
}
$phone = $_GET['phn'];

$query = "SELECT patient.phone,patient.name,appointment.name as  patient,user.name as doctor, department.name as department, appointment.date, appointment.message FROM appointment 
LEFT JOIN patient on patient.id=appointment.patient_id 
LEFT JOIN doctor on doctor.id=appointment.doctor_id 
LEFT JOIN user on user.id=doctor.user_id 
LEFT JOIN department ON department.id=appointment.department_id
WHERE appointment.phone='$phone'";
 $statement = $connect->prepare($query);
 $statement->execute();
 $result = $statement->get_result();
 $appointment = $result->fetch_all(MYSQLI_ASSOC)[0];

?>


                <!-- page header start -->
                <div class="page-header d-flex justify-content-center">
                    <h3 class="page-title text-center">
                        <span class=" text-white me-2">
                            <!-- <i class="mdi mdi-home"></i> -->
                        </span> Appointment Submited
                    </h3>
                    <!-- <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                    <span></span>Overview <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
                  </li>
                </ul>
              </nav> -->
                </div>
                <!-- header contant -->

                <!-- header contant -->

                <h2>
                    <?php
    if(isset($_SESSION['msg'])){
        $_SESSION['msg'];
        unset($_SESSION['msg']);

    }

   
    ?>
                </h2>

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
                                                <th> #SL </th>
                                                <th> Name </th>
                                                <th> Phone </th>
                                                <th> Department </th>
                                                <th> Doctor Name </th>
                                                <th>Message</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
                        if(isset($_GET['phn']) && count($appointment) > 0){
                            
                            ?>

                                            <tr>
                                                <td><?= $appointment['phone'] ?? ''?></td>
                                                <td>
                                                    <?= $appointment['patient'] ?? $appointment['name'] ?>
                                                </td>
                                                <td><?= $appointment['doctor']?></td>


                                                <td><?= $appointment['department']?></td>
                                                <td>
                                                    <?= $appointment['date']?>
                                                </td>
                                            </tr>
                                            <?php }else{ ?>
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
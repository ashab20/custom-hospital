<?php 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


session_start();
require_once('../lib/Crud.php'); 

$mysqli = new Crud();

$connect =  new mysqli(HOST,USER,PASS,DB_NAME);
if($connect->connect_error){
    echo $connect->connect_error;
}


// ! *** Appointment*****

if(isset($_POST["AppointmentFrontend"])){
    // print_r($_POST);

    unset($_POST["AppointmentFrontend"]);
    $patient["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["department_id"] = htmlentities(ucwords($_POST["department_id"]));
    $_POST["doctor_id"] = htmlentities(ucwords($_POST["doctor_id"]));
    $_POST["message"] = htmlentities(ucwords($_POST["message"]));
    $_POST["date"] = htmlentities(ucwords($_POST["date"]));
    
    $phone = $_POST["phone"];
    $patient_id = isset($_POST["patient_id"]);
    if(empty($patient_id)){
      $query = "select id from patient where patient.phone='$phone'";
      $statement = $connect->prepare($query);
      $statement->execute();
      $result = $statement->get_result();
      $patientData = $result->fetch_all(MYSQLI_ASSOC);
      // print_r($patientData);
      if($patientData){
        // print_r($patientData);
        $patient_id = $patientData[0]['id']; 
      }else{
        // echo "ok";
        $phone = htmlentities($_POST["phone"]);
        $name = htmlentities(ucwords($_POST["name"]));
        $age = htmlentities($_POST["age"]);
        $gender = htmlentities($_POST["gender"]);
        
        $query = "INSERT INTO patient (phone, name, age, gender,status) VALUES (?, ?, ?, ?,1)";
        $stmt = $connect->prepare($query);
        $stmt->bind_param("ssis", $phone, $name, $age, $gender);
        // Execute the statement
        $stmt->execute();

        // Check if the insertion was successful
        if ($stmt->affected_rows > 0) {
            // Data was inserted successfully
            $insertedId = $stmt->insert_id; // Get the inserted ID
            echo "Data stored successfully. Inserted ID: " . $insertedId;
        } else {
            // Failed to insert data
            echo "Error storing data.";
        }

        // Close the statement and database connection
        $stmt->close();
        $connect->close();
      }
    }
    
    $ip["patient_id"]=$patient_id;
    
    $ip["discount"] = (int) $_POST["visit_fees"] - $_POST["total"];
  
    $ip["subtotal"]=(int) $_POST["visit_fees"];
    $ip["total"]= (int) $_POST["total"];
    $ip["payment"] = $ip["total"];
    $ip["remark"]="PAID";  
    
  
    unset($_POST["remark"]);
    unset($_POST["payment"]);
    unset($_POST["visit_fees"]);
    unset($_POST["discount"]);
    unset($_POST["total"]);
    unset($_POST["age"]);
    unset($_POST["gender"]);
  
    $ip['ipid'] = uniqid('IP'.date('Ymdhis'));
    $appt = $mysqli->creator("appointment",$_POST);
    if($appt["error"]){
      $_SESSION["msg"]=$appt["error"];
      echo $appt["error"];
      // echo "<script> location.replace('$baseurl/')</script>";
    }else{
        $_SESSION['appt']="<p style='color:green'>Appointment Submited </p>";
      echo "<script> location.replace('$baseurl/pages/success.php?phn=$phone')</script>";
    // else{ 
    //   $ip["appointment_id"]=$appt["insert_id"];
     
    //   if(isset($_POST["discount"])){
    //     $ip["discount"]=$_POST["discount"];
    //   }
    //   $invoice = $mysqli->creator("invoice_payment",$ip);
    //   $invoieInsert_id = $invoice["insert_id"];
  
    //   if($invoice["error"]){
    //     $_SESSION["msg"]=$appt["error"];
    //     echo $invoice["error"];
    //   }
    //   if($appt['msg']='saved'){
    //     // if($user['roles']=='SUPERAMDMIN' or $user['roles']=='AMDMIN'){
    //        $_SESSION['appt']="<p style='color:green'>Appointment Submited </p>";
    //     echo "<script> location.replace('$baseurl/view/payinfo.php?invoice=$invoieInsert_id')</script>";
    //     // }else{
    //     //   $_SESSION['appt']="<p style='color:green'>Appointment Submited </p>";
    //     // echo "<script> location.replace('$baseurl/pages/success.php?phn=$phone')</script>";
    //      }
        
    }
    
  }
  
  
  
  //  *** Appointment END*****
  
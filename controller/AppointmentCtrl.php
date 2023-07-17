<?php 

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

    $patient_id = $_POST["patient_id"];
    if(empty($patient_id)){
        $patientData = $mysqli->selector("select id from patient where patient.phone='$phone'");
        print_r($patientData['msg']); return;
        if($patientData['numrows'] > 0){
            $patientid = $patientData['selectdata'][0]['id'];
        }else{
            $patient["phone"] = htmlentities($_POST["phone"]);
            $patient["name"] = htmlentities(ucwords($_POST["name"]));
            $patient["age"] = htmlentities($_POST["age"]);
            $patient["gender"] = htmlentities($_POST["gender"]);
            $patient = $mysqli->creator("appointment",$patient);
            if($patient["error"]){
                $_SESSION["msg"]=$appt["error"];
                echo $appt["error"];
                echo "<script> location.replace('$baseurl/')</script>";
            }
            $patient_id = $patient['insert_id'];

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
  
    $ip['ipid'] = uniqid('IP'.date('Ymdhis'));
    
    $appt = $mysqli->creator("appointment",$_POST);
    if($appt["error"]){
      $_SESSION["msg"]=$appt["error"];
      echo $appt["error"];
      // echo "<script> location.replace('$baseurl/')</script>";
    }else{ 
      $ip["appointment_id"]=$appt["insert_id"];
     
      if(isset($_POST["discount"])){
        $ip["discount"]=$_POST["discount"];
      }
      $invoice = $mysqli->creator("invoice_payment",$ip);
      $invoieInsert_id = $invoice["insert_id"];
  
      if($invoice["error"]){
        $_SESSION["msg"]=$appt["error"];
        echo $invoice["error"];
      }
      if($appt['msg']='saved'){
        // if($user['roles']=='SUPERAMDMIN' or $user['roles']=='AMDMIN'){
           $_SESSION['appt']="<p style='color:green'>Appointment Submited </p>";
        echo "<script> location.replace('$baseurl/view/payinfo.php?invoice=$invoieInsert_id')</script>";
        // }else{
        //   $_SESSION['appt']="<p style='color:green'>Appointment Submited </p>";
        // echo "<script> location.replace('$baseurl/pages/success.php?phn=$phone')</script>";
        //  }
        
       
      }
    }
    
  }
  
  
  
  //  *** Appointment END*****
  
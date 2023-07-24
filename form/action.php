<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



session_start();
require_once('../lib/Crud.php');

$mysqli = new Crud();


if(isset($_SESSION['userdata'])){
  $user = $_SESSION['userdata'];
}else{
header("location:$baseurl/pages/login.php");

}


// *** profile uploas ***
if(isset($_POST["images_upload"])){
  unset($_POST["images_upload"]);
  if($_FILES["avatar"]["name"]){
      $path_parts = pathinfo($_FILES["avatar"]["name"]);
      $image_name=trim($_SESSION["userdata"]["name"]).$_SESSION["userdata"]["id"].uniqid().".".$path_parts["extension"];
      $up=move_uploaded_file($_FILES["avatar"]["tmp_name"],"../assets/images/avatar/".$image_name);
      if($up){
          $_POST["avatar"]=$image_name;
      }
  }
  $_POST["modified_by"] = $user["id"];
  $_POST["modified_at"] = date("Y-m-d H:i:s");

  $id= $user["id"];
  $result=$mysqli->updator("user",$_POST,"id=$id");
  if($result["error"]){
  $_SESSION["msg"] = $result["error"];
  echo "<script> location.replace('$baseurl/pages/profile.php?id=$id') </script>";
  }
  else{
    $userdata = $mysqli->select_single("SELECT * FROM user WHERE id=$id")["singledata"];
   $_SESSION['userdata'] = $userdata;
    $_SESSION["msg"] = "profile picture Change";
  echo "<script> location.replace('$baseurl/pages/profile.php?id=$id') </script>";
  }
}


// *** Change Password
if(isset($_POST["changePassword"])){
unset($_POST["changePassword"]);
$confirmPass = $_POST["cpassword"];
unset($_POST["cpassword"]);
$id= $_POST["id"];
if($_POST["oldpassword"]!= ''){
  $oldpassword = md5(sha1($_POST["oldpassword"]));
  $dataUser = $mysqli->selector("user","password","id=$id and password='$oldpassword'");
  print_r($dataUser);
  if($dataUser["numrows"] > 0){
    if($confirmPass === $_POST["password"]){
      $_POST["password"] = md5(sha1($_POST["password"]));


        $data = $mysqli->updator("user",['password'=>$_POST["password"]],"id=$id");
        if($data["error"]){
          $_SESSION['msg']=$data['msg'];
          echo "<script> location.replace('$baseurl/pages/updateuser.php?id=$id')</script>";
        }else{
          if($data['msg']='saved'){
            $_SESSION['msg']="<p style='color:green'>Password has been changed</p>";
            echo "<script> location.replace('$baseurl/form/updateuser.php?id=$id')</script>";
          }
        }
}else{
  $_SESSION['msg']="<p style='color:red'>Confirm password does not mathced</p>";
            echo "<script> location.replace('$baseurl/form/updateuser.php?id=$id')</script>";
}
  }else{
    $_SESSION['msg']="<p style='color:red'>Wrong password.Please input correct password</p>";
            echo "<script> location.replace('$baseurl/form/updateuser.php?id=$id')</script>";
  }
}

}


// *** forget Password
if(isset($_POST["forgetPassword"])){
  unset($_POST["forgetPassword"]);

  }




// ! *** Appointment*****

if(isset($_POST["appt"])){
  unset($_POST["appt"]);
  $_POST["name"] = htmlentities(ucwords($_POST["name"]));
  $_POST["message"] = htmlentities(ucwords($_POST["message"]));
  $_POST["date"] = $_POST["date"];
  $_POST["phone"] = htmlentities($_POST["phone"]);
  $phone = $_POST["phone"];

  $ip["patient_id"]=$_POST["patient_id"];

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

// capacity




// ! *** Updated user ***

if(isset($_POST["updateData"])){
  unset($_POST["updateData"]);
    unset($_POST["cpassword"]);

    $_POST["modified_by"] = $user["id"];
    $_POST["modified_at"] = date("Y-m-d H:i:s");

    $_POST["email"] = htmlentities(trim($_POST["email"]));
    $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    if($_POST["status"]==""){
      unset($_POST["status"]);
    }else{
      (int) $_POST["status"];
    }
    $id= $_POST["id"];
    $data = $mysqli->updator("user",$_POST,"id=$id");
    if($data["error"]){
      $_SESSION['msg']=$data['msg'];
      echo "<script> location.replace('$baseurl/pages/updateuser.php?id=$id')</script>";
    }else{
      if($data['msg']='saved'){
        $_SESSION['msg']="<p style='color:green'>Update Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/profile.php?id=$id')</script>";
      }

    }
}


if(isset($_GET['apptId'])){

  $appointmentId = $_GET['apptId'];
  $userId = $user['id'];
  if($user){
    $deact['modified_by'] = $user['id'];
    $deact['status'] = $user['id'];
  }
  // $data = $mysqli->deactive('appointment',$deact,"id=$appointmentId");
  $data = $mysqli->custome_query("UPDATE appointment SET status = 0, modified_by = '$userId' WHERE id = $appointmentId;");
  if($data){
    $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Successfully Canceled Appointment</p>";
    echo "<script> location.replace('$baseurl/pages/appointmented.php')</script>";

  }else{
      $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Cannot the Canceled Appointment</p>";
        echo "<script> location.replace('$baseurl/pages/appointmented.php')</script>";

  }
}
// ! * Update PATIENT *
if(isset($_POST["updateDataPatient"])){
  unset($_POST["updateDataPatient"]);
  $patientId = $_POST['patientId'];
  unset($_POST["patientId"]);
  $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    $_POST["gender"] = htmlentities($_POST["gender"]);
    $_POST["father_or_husband_name"] = $_POST["father_or_husband_name"];
    $_POST["mother_name"] = $_POST["mother_name"];
    $_POST["age"] = htmlentities($_POST["age"]);

    if($user){
      $_POST["created_by"] = $user["id"];
    }
    $phone = $_POST["phone"];
    $data = $mysqli->updator("patient",$_POST,"id=$patientId");
    if($data["error"]){
      $_SESSION['msg']=$data['msg'];
      echo "<script> location.replace('$baseurl/pages/editpatient.php?patientId=$patientId')</script>";

    }else{
      if($data['updated']){
        $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Patient Updated Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/allpatient.php')</script>";

      }
    }
}

// ! *** ADD PATIENT ***
if(isset($_POST["addPatient"])){
  unset($_POST["addPatient"]);

  $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    $_POST["gender"] = htmlentities($_POST["gender"]);
    $_POST["age"] = htmlentities($_POST["age"]);

    htmlentities($_POST["permanent_address"]);
    htmlentities($_POST["present_address"]);

    if($user){
      $_POST["created_by"] = $user["id"];
    }
    $phone = $_POST["phone"];
    $data = $mysqli->creator("patient",$_POST);
    if($data["error"]){
      $_SESSION['msg']=$data['msg'];
      echo "<script> location.replace('$baseurl/pages/patient.php')</script>";

    }else{
      if($data['msg']=='saved'){
        $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Patient Added Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/patient.php?phn=$phone')</script>";

      }



    }
}


// ! *** Update PATIENT ***
if(isset($_POST["updateDataPatient"])){
  unset($_POST["updateDataPatient"]);
  $patientId = $_POST['patientId'];
  unset($_POST["patientId"]);
  $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    $_POST["gender"] = htmlentities($_POST["gender"]);
    $_POST["father_or_husband_name"] = $_POST["father_or_husband_name"];
    $_POST["mother_name"] = $_POST["mother_name"];
    $_POST["age"] = htmlentities($_POST["age"]);

    if($user){
      $_POST["created_by"] = $user["id"];
    }
    $phone = $_POST["phone"];
    $data = $mysqli->updator("patient",$_POST,"id=$patientId");
    if($data["error"]){
      $_SESSION['msg']=$data['msg'];
      echo "<script> location.replace('$baseurl/pages/editpatient.php?patientId=$patientId')</script>";
      
    }else{
      if($data['updated']){
        $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Patient Updated Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/allpatient.php')</script>";
       
      }
    }
}





// *** ADD DOCTOR ***

if(isset($_POST["adddoctor"])){
  unset($_POST["adddoctor"]);

  $_POST["father_name"] = htmlentities(ucwords($_POST["father_name"]));
  $_POST["mother_name"] = htmlentities(ucwords($_POST["mother_name"]));
  $_POST["qualification"] = htmlentities(ucwords($_POST["qualification"]));
  $_POST["gratuated_from"] = htmlentities(ucwords($_POST["gratuated_from"]));
  $_POST["gender"] = htmlentities($_POST["gender"]);
    if($user){
      $_POST["created_by"] = $user["id"];
    }
    $data = $mysqli->creator("doctor",$_POST);
    if($data["error"]){
      $_SESSION["dct"]=$data["msg"];
      echo "<script> location.replace('adddoctor.php')</script>";

    }else{
      if($data["msg"]=="saved"){
        if($data["selectdata"]["roles"]== "SUPERADMIN"){
          echo "<script> location.replace('$baseurl/dashboard/admin.php')</script>";
        }elseif ($data['selectdata']['roles']== 'ADMIN'){
          echo "<script> location.replace('$baseurl/dashboard/admin.php')</script>";
        }
        $_SESSION['dct']="<p class='h3 text-success text-center justify-content-center mx-auto'>Doctor Added Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/doctor.php')</script>";
      }
    }
}



// Update Doctor

if(isset($_POST["update_doctor"])){
  unset($_POST["update_doctor"]);
  unset($_POST["name"]);
  $id = $_POST["id"];
  unset($_POST["id"]);
  $_POST["father_name"] = htmlentities(ucwords($_POST["father_name"]));
  $_POST["mother_name"] = htmlentities(ucwords($_POST["mother_name"]));
  $_POST["qualification"] = htmlentities(ucwords($_POST["qualification"]));
  $_POST["gratuated_from"] = htmlentities(ucwords($_POST["gratuated_from"]));
  $_POST["gender"] = htmlentities($_POST["gender"]);



      $_POST["modified_by"] = $user["id"];
      $_POST["modified_at"] = date("Y-m-d H:i:s");


    $data = $mysqli->updator("doctor",$_POST,"id=$id");
    if($data['error']){
      $_SESSION['msg']=$data['error'];
      echo "<script> location.replace('adddoctor.php?doctorid=$id')</script>";

    }else{
      if($data['updated']=='saved'){
        if($data['selectdata']['roles']== 'SUPERADMIN'){
          echo "<script> location.replace('$baseurl/dashboard/doctor.php')</script>";
        }elseif ($data['selectdata']['roles']== 'ADMIN'){
          echo "<script> location.replace('$baseurl/dashboard/doctor.php')</script>";
        }
        $_SESSION['dct']="<p class='h3 text-success text-center justify-content-center mx-auto'>Updated Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/profile.php?doctorid=$id')</script>";
      }
      echo "<script> location.replace('$baseurl/pages/profile.php?doctorid=$id')</script>";
    }
}

// Add department

                                                    // Add Categories


// Add department

if(isset($_POST['dept_form'])){
  unset($_POST['dept_form']);

  $_POST['name'] = htmlentities(ucwords($_POST['name']));
    if($user){
      $_POST['created_by'] = $user['id'];
    }
    $data = $mysqli->creator('department',$_POST);
    if($data['error']){
      $_SESSION['msg']=$data['msg'];
      echo "<script> location.replace('$baseurl/controller/department.php')</script>";

    }else{
      if($data['msg']=='saved'){
          echo "<script> location.replace('$baseurl/controller/department.php')</script>";
        $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Department Added Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/doctor.php')</script>";
      }
    }
}

// Add Designation

if(isset($_POST['add_degi'])){
  unset($_POST['add_degi']);

  $_POST['designation_name'] = htmlentities(ucwords($_POST['designation_name']));
  $_POST['base_salary'] = htmlentities(ucwords($_POST['base_salary']));
  $_POST['bounus_by_percent'] = htmlentities(ucwords($_POST['bounus_by_percent']));
  $_POST['total_bounus'] = htmlentities(ucwords($_POST['total_bounus']));
  if($user){
    $_POST['created_by'] = $user['id'];
  }
  $data = $mysqli->creator('designation',$_POST);
  if($data['error']){
      $_SESSION['degi']=$data['msg'];
      echo "<script> location.replace('$baseurl/controller/designation.php')</script>";

    }else{
      if($data['msg']=='saved'){
          echo "<script> location.replace('$baseurl/controller/designation.php')</script>";
        $_SESSION['degi']="<p class='h3 text-success text-center justify-content-center mx-auto'>Designation Added Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/doctor.php')</script>";
      }
    }
}


// Add Room

if(isset($_POST['add_room'])){
  unset($_POST['add_room']);


  $_POST['room_no'] = htmlentities(ucwords($_POST['room_no']));
  $_POST['floor'] = htmlentities(ucwords($_POST['floor']));

  if($_POST['facilities']){
    $_POST['details'] = json_encode( $_POST['facilities']);
  }else{
    $_POST['details'] = null;
  }

  unset($_POST['facilities']);

    if($user){
      $_POST['created_by'] = $user['id'];
    }
    $data = $mysqli->creator('room',$_POST);
    if($data['error']){
      $_SESSION['room']=$data['msg'];
      echo "<script> location.replace('$baseurl/controller/room.php')</script>";

    }else{
      if($data['msg']=='saved'){
          echo "<script> location.replace('$baseurl/controller/room.php')</script>";
        $_SESSION['room']="<p class='h3 text-success text-center justify-content-center mx-auto'>Room Added Successfully</p>";
        echo "<script> location.replace('$baseurl/pages/doctor.php')</script>";
      }
    }
}




// ? UPDATE CATEGORIES



// Update department

if(isset($_POST["update_dept"])){
  unset($_POST["update_dept"]);
  $dept_id=$_POST["id"];
  unset($_POST["id"]);

  $_POST["name"] = htmlentities(ucwords($_POST["name"]));
  $_POST["modified_by"] = $user["id"];
  $_POST["modified_at"] = date("Y-m-d H:i:s");

  $update = $mysqli->updator("department",$_POST,"id=$dept_id");
  if($update["error"]){
    $_SESSION['msg']=$update['msg'];
    echo "<script> location.replace('$baseurl/pages/editcategories.php?deptId=$dept_id')</script>";

  }else{
    if($update['updated']){
      echo "<script> location.replace('$baseurl/controller/department.php')</script>";
      $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Department Updated Successfully</p>";
    }
  }
}


// Update Designation

if(isset($_POST["update_degi"])){
  unset($_POST["update_degi"]);
  $desi_id=$_POST["id"];
  unset($_POST["id"]);

  $_POST["designation_name"] = htmlentities(ucwords($_POST["designation_name"]));
  $_POST["base_salary"] = htmlentities(ucwords($_POST["base_salary"]));
  $_POST["bounus_by_percent"] = htmlentities(ucwords($_POST["bounus_by_percent"]));
  $_POST["total_bounus"] = htmlentities(ucwords($_POST["total_bounus"]));
  $_POST["modified_by"] = $user["id"];
  $_POST["modified_at"] = date("Y-m-d H:i:s");

  $update = $mysqli->updator("designation",$_POST,"id=$desi_id");
  if($update["error"]){
    $_SESSION["msg"]=$update["msg"];
    echo $update['msg'];
    echo "<script> location.replace('$baseurl/pages/editcategories.php?desiId=$desi_id')</script>";

  }else{
    if($update['updated']){
      echo "<script> location.replace('$baseurl/controller/designation.php')</script>";
      $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Designation Updated Successfully</p>";
    }
  }
}


// Update Room

if(isset($_POST["update_room"])){
  unset($_POST["update_room"]);
  $room_id=$_POST["id"];
  unset($_POST["id"]);

  $_POST["floor"] = htmlentities(ucwords($_POST["floor"]));
  $_POST["room_no"] = htmlentities(ucwords($_POST["room_no"]));
  $_POST["details"] = htmlentities(ucwords($_POST["details"]));
  $_POST["room_type"] = htmlentities(ucwords($_POST["room_type"]));
  $_POST["modified_by"] = $user["id"];
  $_POST["modified_at"] = date("Y-m-d H:i:s");

  $update = $mysqli->updator("room",$_POST,"id=$room_id");
  if($update["error"]){
    $_SESSION["msg"]=$update["msg"];
    echo "<script> location.replace('$baseurl/pages/editcategories.php?roomId=$room_id')</script>";

  }else{
    if($update['updated']){
      echo "<script> location.replace('$baseurl/controller/room.php')</script>";
      $_SESSION['msg']="<p class='h3 text-success text-center justify-content-center mx-auto'>Room Updated Successfully</p>";
    }
  }
}



// prescription

if(isset($_POST["prescription"])){
unset($_POST["prescription"]);

if(isset($_POST["appointment_id"])){
  $_POST["appointment_id"] = ( int) $_POST["appointment_id"];

}elseif(isset($_POST["admit_id"])){
  $_POST["admit_id"] = ( int) $_POST["admit_id"];

}
$insert_id = false;
foreach($_POST["outer-list"] as $medicine){
  $medicine["patient_id"] = $_POST["patient_id"];
  $medicine["mg"] = floatval($medicine["mg"]);
  if($medicine["type"] && $medicine["medicine_name"]){
    $create=$mysqli->creator("medicine",$medicine);
    if($create["error"]){
      $_SESSION["msg"] = $create["error"];
    }
    $insert_id[] .= $create["insert_id"];

  }
}
$_POST["medicine_id"] = json_encode($insert_id);
$tests = $description = $advice = [];
foreach($_POST["inner-list"] as $test){
  $tests[] .= $test["test"];
  $description[] .= $test["description"];
  $advice[] .= $test["advice"];
}
echo "<br>";
unset($_POST["outer-list"]);
unset($_POST["inner-list"]);

$_POST["test"] = json_encode($tests);
$_POST["description"] = json_encode($description);
$_POST["advice"] = json_encode($advice);

$prescription = $mysqli->creator("prescription",$_POST);
if($prescription["error"]){
  $_SESSION["msg"] = $prescription["error"];
  echo "<script> location.replace('$baseurl/pages/prescription.php?id=".$_post['patient_id']."')</script>";
}else{
  $inserted_id = $prescription["insert_id"];
  $_SESSION["msg"] = "Prescription added to".$prescription["insert_id"];
  echo "<script> location.replace('$baseurl/view/viewprescriotion.php?presid=$inserted_id')</script>";

}


}








if(isset($_POST["patientcare"])){

}

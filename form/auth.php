<?php  
session_start();
require_once('../lib/Crud.php'); 

$mysqli = new Crud();


// if(isset($_SESSION['userdata'])){
//   $user = $_SESSION['userdata'];
// }else{
// header("location:$baseurl/pages/login.php");

// }


// ! *** LOGIN ***
if(isset($_POST["login"])){
//   echo 'Hello';
//   return;

    unset($_POST["login"]);
    if(($_POST["password"] && $_POST["email"]) == ''){
      $_SESSION["msg"]="<p style='color:red'>Please Input valid email and password.<br> Please try again!</p>";
      echo "<script> location.replace('$baseurl/pages/login.php')</script>";
    }
    $_POST["password"]= md5(sha1($_POST["password"]));
  
    $data = $mysqli->selector("user","*",$_POST);
    if($data["numrows"]== 0){
      $_SESSION["msg"]="<p style='color:red'>User name or password is wrong.<br> Please try again!</p>";
      echo "<script> location.replace('$baseurl/pages/login.php')</script>";
    }else{
      $data['selectdata'] = $data['selectdata'][0];
      if($data['selectdata']['status']==1){
        
        $_SESSION['userdata']=$data['selectdata'];
        if($data['selectdata']['roles'] == 'PATIENT'){
          $usesr_id = $data['selectdata']['id'];
          $patient = $mysqli->selector("patient","*",['user_id'=>$usesr_id])['selectdata'][0];
          $_SESSION['userdata']['patient_id']=$patient['id'];
        }
        $_SESSION['msg']="Login success";
  

        // print_r($_SESSION['userdata']);
        // return;

        if($data['selectdata']['roles']== 'SUPERADMIN'){
          echo "<script> location.replace('$baseurl/dashboard/')</script>";
        }elseif ($data['selectdata']['roles']== 'ADMIN'){
          echo "<script> location.replace('$baseurl/dashboard/admin.php')</script>";
        }elseif ($data['selectdata']['roles']== 'DOCTOR'){
          $id = $_SESSION['userdata']['id'];
          $checkDoctor = $mysqli->select_single("SELECT * FROM doctor WHERE id=$id");
          if($checkDoctor['numrows'] != 1){
            header("location:$baseurl/form/adddoctor.php");
          }else{
            if($checkDoctor['singledata']["status"] == 1){
              $_SESSION['doctordata']= $checkDoctor['singledata'];
              echo "<script> location.replace('$baseurl/pages/doctor.php')</script>";
            }else{
              $_SESSION['msg']="Your Account has been dissable. Please Contact the Admin.";
            }
          }
          
        }elseif ($data['selectdata']['roles']== 'PATIENT'){
          echo "<script> location.replace('$baseurl/dashboard/patient.php')</script>";
        }else{
          echo "<script> location.replace('$baseurl/pages/login.php')</script>";
        }
  
      }else{
        $_SESSION['msg']="You are not active user. Please contact to admin";
      echo "<script> location.replace('$baseurl/pages/login.php')</script>";
      }
      
      
    }
    
}

//  *** LOGIN END***

// ! *** REGISTRATION ***

if(isset($_POST["reg"])){
    if($_POST["cpassword"] != $_POST["password"]){
      $_SESSION["msg"]="Password Does't matched!,Please Try again";
      echo "<script> location.replace('$baseurl/pages/register.php')</script>";
   
    }
    unset($_POST["reg"]);
    unset($_POST["cpassword"]);
    $_POST["password"] = md5(sha1($_POST["password"]));
    $_POST["email"] = htmlentities(trim($_POST["email"]));
    $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    $data = $mysqli->creator("user",$_POST);
    if($data["error"]){
      $_SESSION["msg"]=$data["msg"];
      echo "<script> location.replace('$baseurl/pages/register.php')</script>";
     
    }else{
      $user_id =  $data['insert_id'];
      $patientData =  $data = $mysqli->selector("user","*","id='$user_id '")['selectdata'][0];
      $patient['user_id'] =  $user_id;
      $patient["name"] = htmlentities(ucwords($_POST["name"]));
      $patient["phone"] = htmlentities($_POST["phone"]);
      $patient["created_by"] = $user_id;
      $data = $mysqli->creator("patient",$patient);
      if($data['msg']='saved'){
        $_SESSION['msg']="<p style='color:green'>Registration Successfully</p>";
       
      }
      
      echo "<script> location.replace('$baseurl/pages/login.php')</script>";
  
    }
    
}

// ! *** ADD USER ***

if(isset($_POST["adduser"])){
    unset($_POST["reg"]);
    unset($_POST["cpassword"]);
    if($user){
      $_POST["created_by"] = $user["id"];
    }
    $_POST["password"] = md5(sha1($_POST["password"]));
    $_POST["email"] = htmlentities(trim($_POST["email"]));
    $_POST["name"] = htmlentities(ucwords($_POST["name"]));
    $_POST["phone"] = htmlentities($_POST["phone"]);
    $data = $mysqli->creator("user",$_POST);
    if($data["error"]){
      $_SESSION["msg"]=$data["msg"];
      echo "<script> location.replace('$baseurl/pages/register.php')</script>";
     
    }else{
      // $user_id =  $data['insert_id'];
      // $patientData =  $data = $mysqli->selector("user","*","id='$user_id '")['selectdata'][0];
      // $patient['user_id'] =  $user_id;
      // $patient["name"] = htmlentities(ucwords($_POST["name"]));
      // $patient["phone"] = htmlentities($_POST["phone"]);
      // $patient["created_by"] = $user_id;
      // $data = $mysqli->creator("patient",$patient);
      if($data['msg']='saved'){
        $_SESSION['msg']="<p style='color:green'>Registration Successfully</p>";
       
      }
      
      echo "<script> location.replace('$baseurl/pages/login.php')</script>";
  
    }
    
}
<?php
    session_start();
    require_once('./config.php');
    $connect = new mysqli(HOST,USER,PASS,DB_NAME);
    if($connect->connect_error){
        echo $connect->connect_error;
    }

    $query = "SELECT * FROM department WHERE status=1";
    
    $departmentData = $connect->query($query);
    $department = $departmentData->fetch_array();
    print_r($department);
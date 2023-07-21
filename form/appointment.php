<?php

    $connect =  new mysqli(HOST,USER,PASS,DB_NAME);
    if($connect->connect_error){
        echo $connect->connect_error;
    }
    $query = "SELECT id, name FROM department WHERE status = 1";
    $statement = $connect->prepare($query);
    $statement->execute();
    $result = $statement->get_result();
    $departments = $result->fetch_all(MYSQLI_ASSOC);
    // 
    // if($departmentData['error']){
    //   $_SESSION['msg']=$departmentData['msg'];
    //   echo "error";
    // }

    // print_r($department);

?>



<form action="<?= $baseurl ?>controller/AppointmentCtrl.php" method="POST" class="
    php-email-form" data-aos="fade-up" data-aos-delay="100" id=apptform>
    <div class="row">
        <div class="col-md-4 form-group">
            <div><label for="guardian_name">Full Name:</label><span class="float-end text-danger">*</span></div>
            <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
        </div>

        <div class="col-md-4 form-group mt-3 mt-md-0">
            <div><label for="guardian_name">Phone:</label><span class="float-end text-danger">*</span></div>
            <input type="text" class="form-control" name="phone" id="phone" placeholder="Your Phone" required min="10"
                max="11">
        </div>
        <div class="col-md-4 form-group mt-3 mt-md-0">
            <div><label for="guardian_name">Age:</label><span class="float-end text-danger">*</span></div>
            <input type="text" class="form-control" name="age" id="" placeholder="Input Age">

        </div>
    </div>
    <div class="row">
        <div class="col-md-4 form-group mt-3">
            <div><label for="guardian_name">Date:</label><span class="float-end text-danger">*</span></div>
            <input type="date" id="appointmentDate" name="date" min="<?=date('Y-m-d') ?>" required
                class="form-select p-1" required>
        </div>
        <div class="col-md-4 form-group mt-3">
            <div><label for="guardian_name">Department:</label><span class="float-end text-danger">*</span></div>
            <select id="department" name="department_id" required class="form-select" onchange="get_doctor(this.value)">
                <option value="">Department...</option>
                <?php foreach ($departments as $dept) : ?>
                <option value="<?= $dept['id'] ?>"><?= $dept['name'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="col-md-4 form-group mt-3">
            <div><label for="guardian_name">Doctor:</label><span class="float-end text-danger">*</span></div>
            <select id="depdoctor" onchange="get_time(this.value)" name="doctor_id" class="form-select" required>
                <option value="">Doctor...</option>
            </select>
            <input type="hidden" id="limit">
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 form-group mt-3 mt-md-0">
            <div><label for="gender">Gender:</label><span class="float-end text-danger">*</span></div>
            <select name="gender" id="" class="form-control">
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>

        </div>
        <div class="col-md-4 form-group mt-3 mt-md-0">
            <div><label for="gender">Time:</label><span class="float-end text-danger">*</span></div>
            <input type="text" readonly class="form-control" id="timees">

        </div>
    </div>
    <div class="row">
        <div class="col-md-4 form-group mt-3">
            <label for="fees">Consultancy Fees:</label>
            <input class="form-control m-1" type="text" name="visit_fees" readonly id='fees'>
        </div>
        <div class="col-md-4 form-group mt-3">
            <label for="fees">Total:</label>
            <input class="form-control m-1" type="text" name="total" id='total' readonly>
        </div>
        <div class="col-md-4 form-group mt-3">
            <label for="fees">Discount(%):</label>
            <input class="form-control m-1" type="text" name="discount" readonly id='discount'
                onchange="getDiscount(this.value)">
            <!-- <input  type="number" hidden id='wdiscount'> -->
        </div>
    </div>
    <div class="row">
        <div class="form-group ">
            <label for="fees">Problems:</label>
            <textarea class="form-control" name="message" rows="5" placeholder="Message (Optional)"></textarea>
        </div>
    </div>
    <div class="my-3">
        <div class="loading">Loading</div>
        <div class="error-message"></div>
        <div class="sent-message">Your appointment request has been sent successfully. Thank you!</div>
    </div>
    <div class="text-center">
        <input type="submit" value="Make an Appointment" class="btn appointment-btn" name="AppointmentFrontend" />
    </div>
</form>


<script>
function get_doctor(dep) {

    $.ajax({
        url: "<?= $baseurl ?>" + 'form/data.php?department=' + dep,
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
    let phone = $("#phone").val();
    let limit = $("#limit").val();
    let appointmentDate = $("#appointmentDate").val();
    if (!phone) {
        alert('Please Insert All values first!')
        $('#depdoctor').html("<option>No data</option>");
        return false
    }
    if (!appointmentDate) {
        alert('Please Select Appointment date first!')
        $('#depdoctor').html("<option>No data</option>");
        return false
    }

    $.ajax({
        url: "<?= $baseurl?>" + 'form/data.php?time=' + shift + '&phone=' + phone + '&apptdate=' +
            appointmentDate,
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        success: function(data) {
            if (data["status"] == 'success') {
                $('#timees').val(JSON.stringify(data["time"]).trim('"'));
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
        url: "<?= $baseurl?>" + 'form/data.php?time=' + rate,
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

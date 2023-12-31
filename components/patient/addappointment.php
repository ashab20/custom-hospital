<div class="row mt-1 d-none" id="appointment">
    <div class="col-12 ">
        <div class="card w-100 mx-auto">
            <p class="closebtn" id="closebtn">
                <i class="mdi mdi-close-circle-outline cursor-pointer text-danger"
                    onclick="$('#appointment').toggleClass('d-none');appointmentBtn.toggleClass('btn-dark');">
                </i>
            </p>

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

                <form class=" justify-content-center items-center" method="POST" action="<?=$baseurl?>/form/action.php">
                    <input type="text" hidden name="patient_id" value="<?= $patient_id ?>" id="patient_id">
                    <input type="text" hidden name="name" value="<?= $patientSingleData['singledata']['name'] ?>">
                    <input type="text" hidden name="phone" value="<?= $patientSingleData['singledata']['phone'] ?>">
                    <input type="text" hidden name="created_by" value="<?= $usr['id'] ?>">
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-3 mx-2">
                            <div><label for="guardian_name">Date:</label><span class="float-end text-danger">*</span>
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
                            <div><label for="guardian_name">Doctor:</label><span class="float-end text-danger">*</span>
                            </div>
                            <select id="depdoctor" onchange="get_time(this.value)" name="doctor_id" class="form-select"
                                required>
                                <option value="">Doctor...</option>
                            </select>
                        </div>



                    </div>
                    <div class="form-row d-flex justify-content-center">
                        <div class="form-group col-md-3 mx-2">
                            <div><label for="guardian_name">Time:</label><span class="float-end text-danger">*</span>
                            </div>
                            <input type="text" name="" readonly class="form-control" id="time">
                        </div>
                        <div class="form-group col-md-3 mx-2">
                            <label for="fees">Consultancy Fees:</label>
                            <input class="form-control m-1" type="text" name="visit_fees" readonly id='fees'>
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
                        <button type="submit" class="btn btn-primary" name="appt">Make Appointment</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>

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
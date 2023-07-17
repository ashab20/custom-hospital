<?php 
require_once('../lib/Crud.php'); 
require_once('../include/header.php');

// if(!$_SESSION["userdata"]){
//   echo "<script> location.replace('$baseurl/dashboard/')</script>";
// }

if($usr['roles'] !== 'SUPERADMIN' && $usr['roles'] !== 'ADMIN'){
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
        <?php require_once('../include/sidebar.php') ?>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper ">



                <?php
$mysqli = new Crud();
?>
                <!-- *** APPOINTMENT *** -->
                <?php if($invoice['appointment_id'] != null){ 
                $appointmentId = $invoice['appointment_id'];                
                $data = $mysqli->find("SELECT u.name ,a.id,d.qualification,u.phone,a.date,a.time FROM user u JOIN doctor d on u.id=d.user_id JOIN appointment a on a.doctor_id=d.id WHERE a.id=$appointmentId");
                if($data["numrows"] > 0){
                ?>
                <div class="row">
                    <div class="table-responsive col-md-9">
                        <table class="table table-striped table-borderless border-0 border-b-2 brc-default-l1">
                            <thead class="bg-none bgc-default-tp1">
                                <tr style="border-bottom: 1px solid #ddd;">
                                    <th>Doctor's Name</th>
                                    <th>Appointmetn id</th>
                                    <th>Consulant Fee</th>
                                    <th width="140">Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?=$data["singledata"][0]["name"] ?></td>
                                    <td><?= $appointmentId ?></td>
                                    <td><?= $invoice['subtotal'] ?></td>
                                    <td><?= $invoice['total'] ?></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <?php }  ?>
                <hr />

                <div style="justify-content: space-between;display: flex;">
                    <span class="text-secondary-d1 text-105">Thank you for choicing this
                        hospital</span>
                    <?php
                            if(isset($invoice['remark']) && $invoice['remark'] == 'DUE'){
                        ?>
                    <button href="#" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0"
                        onclick="$('#payment').removeClass('d-none');$('.page-content').addClass('d-none')">Pay
                        Now</button>
                    <?php } ?>
                    <?php 
                        if($invoice['appointment_id'] != null && $invoice['remark'] == 'PAID'){
                            ?>
                    <button type="button" class="btn btn-info btn-bold px-4 float-right mt-3 mt-lg-0" id="card">Get
                        Appointment Card</button>

                    <?php  } ?>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- *** APPOINTMENT CARD ***-->
<div id="card-content" style="width: 100%;
            height: 25rem;
            display: none;
            transform: translatey(50%);
            position: absolute;
            padding: 1rem;
            z-index: 1000;
            top: 0;
            margin-top: 6rem;
            justify-content: center;
            justify-items: center;
            margin: 0px auto;">
    <div id="appointmentCard"
        style="width: 30rem; height:100%;box-shadow: 1px 0px 10px 5px whitesmoke;border-radius:.2rem;">
        <div style="background:coral;border-radius:.2rem;text-align:center;">
            <h3 style="color:whitesmoke;font-size:1.5rem;font-weight:600; padding:1rem;">APPOINTMENT
                CARD</h3>
        </div>
        <div style="text-align:center;">
            <h5 style="color:#111"><?=$data["singledata"][0]["name"] ?>
                (<?=$data["singledata"][0]["qualification"] ?>)</h5>
            <p>
                <?=$data["singledata"][0]["phone"] ?>
            </p>
            <hr style="background-color: #ddd;">
        </div>
        <div style="justify-content:space-around;margin:1rem;border:1px dashed #ddd;padding:1rem; ">
            <span>
                <label for="">Name:</label>
                <input style="border:none;background:#ddd;padding:.4rem;border-radius:.2rem;" type="text" readonly
                    value="<?= $invoice['name']?>">
                <label for="">Appointment Id:</label>
                <input
                    style="width: 20%;border:none;background:#ddd;padding:.4rem;margin-top:.5rem;border-radius:.2rem;"
                    type="text" readonly value="<?= $invoice['appointment_id']?>">
            </span>
            <br>
            <span>
                <label for="">Date:</label>
                <input
                    style="width: 45%;border:none;background:#ddd;padding:.4rem;margin-top:.3rem;border-radius:.2rem;"
                    type="text" readonly value="<?= $data["singledata"][0]['date']?>">
                <label for="">Time:</label>
                <input
                    style="width: 30%;border:none;background:#ddd;padding:.4rem;margin-top:.5rem;margin-right:.5rem;border-radius:.2rem;"
                    type="text" readonly value="<?= $data["singledata"][0]['time']?>">
            </span>
            <span style="display: flex;justify-content:space-around;margin-top:5rem;">
                <label for="" style="border-top: 1px dashed;">Attentance</label>
                <label for=""></label>
                <label for="" style="border-top: 1px dashed;">Doctor's Approval</label>
            </span>
        </div>

    </div>

</div>
</div>

<?php 
}else{
    echo "<script>location.replace('$baseurl/pages/error-404.html');</script>";
}
?>


</div>
<!-- content-wrapper ends -->
<!-- partial:include/footer.php -->
<?php require_once('../include/footer.php') ?>



<script>
$(document).ready(() => {

    // let total = $('#get_total').text();
    // let payment = $('#get_payment').text();
    // let due = $('#get_due').text();
    // let setTotal = $('#set_total').val(total);
    // let setDue = $('#set_due').val(due);
    // let setPayment = $('#set_payment').val();


    $("#card").click(() => {
        $("#card-content").css({
            "display": "block"
        })
        let printContents = $("#appointmentCard").html();
        let originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;

        window.print();

        document.body.innerHTML = originalContents;
        $("#card-content").css({
            "display": "none"
        })
    });


    $('#printer').click(() => {
        $("#card").css({
            "display": "none"
        });
        let printContent = $("#printPage").html();
        let payBill = document.body.innerHTML;

        document.body.innerHTML = printContent;

        window.print();

        document.body.innerHTML = payBill;

        $("#card").css({
            "display": "block"
        });

    })
})
</script>
<!-- ***@DOCTOR END*** -->
<?php if ($usr['roles'] === 'ASSISTANT' || $usr['roles'] === 'ADMIN' || $usr['roles'] === 'SUPERADMIN') { ?>
<!-- *** ASSISTANT *** -->
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <a href="<?= $baseurl ?>/pages/profile.php?id=<?= $usr['id'] ?>" class="nav-link">
                <div class="nav-profile-image">
                    <?php if ($usr['avatar'] !== null) { ?>
                    <img src="../assets/images/avatar/<?= $usr['avatar'] ?>" alt="" width="100px" />
                    <?php } else {  ?>
                    <img src="../assets/images/faces-clipart/pic-4.png" alt="" width="100px" />
                    <?php } ?>
                    <span class="login-status online"></span>
                    <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                    <span class="font-weight-bold mb-2">
                        <?= $usr['name']; ?>
                    </span>
                    <span class="text-secondary text-small">
                        <?= $usr['roles']; ?>
                    </span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= $baseurl ?>/dashboard/">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <?php if ($usr['roles'] === 'ADMIN' || $usr['roles'] === 'SUPERADMIN') { ?>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#general-pages" aria-expanded="false"
                aria-controls="general-pages">
                <span class="menu-title">User</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-medical-bag menu-icon"></i>
            </a>
            <div class="collapse" id="general-pages">
                <ul class="nav flex-column sub-menu">
                    <!-- <li class="nav-item"> 
                    <a class="nav-link" href="<?= $baseurl ?>/dashboard/"> Overview                      
                    </a>
                  </li> -->
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="<?= $baseurl ?>/dashboard/user.php">
                            Users
                        </a>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="<?= $baseurl ?>/dashboard/doctor.php">
                            Doctors
                        </a>
                    </li>
                    <!-- <li class="nav-item">
                    <a class="nav-link" href="<?= $baseurl ?>/dashboard/emp.php"> 
                      Employees
                    </a>
                  </li> -->
                    <!-- <li class="nav-item">
                    <a class="nav-link" href="<?= $baseurl ?>/dashboard/patient.php"> 
                      Patients
                    </a></li> -->
                </ul>
            </div>
        </li>
        <?php } ?>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#user" aria-expanded="false" aria-controls="user">
                <span class="menu-title">Profile</span>
                <i class="menu-arrow"></i>
                <i class=" mdi mdi-account-circle menu-icon"></i>
            </a>
            <div class="collapse" id="user">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/pages/profile.php?id=<?= $usr['id'] ?>"> Profile </a></li>
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/form/updateuser.php?id=<?= $usr['id'] ?>"> Update Profile </a></li>
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/pages/changepassword.php?id=<?= $usr['id'] ?>"> Change Password </a>
                    </li>
                </ul>
            </div>
        </li>
        <!-- Patien -->
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic1" aria-expanded="false"
                aria-controls="ui-basic">
                <span class="menu-title">Patients</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-account-circle menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic1">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="<?= $baseurl ?>/pages/patient.php">Add Patient</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link" href="<?= $baseurl ?>/pages/allpatient.php">Patient
                            List</a></li>
                    <li class="nav-item"> <a class="nav-link" href="<?= $baseurl ?>/pages/appointmented.php">Appointment
                            List</a></li>
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/pages/pending-appointmented.php">Pending Appointment
                            List</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>

<?php } elseif ($usr['roles'] === 'PATIENT') {  ?>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item nav-profile">
            <a href="<?= $baseurl ?>/pages/profile.php?id=<?= $usr['id'] ?>" class="nav-link">
                <div class="nav-profile-image">
                    <?php if ($usr['avatar'] !== null) { ?>
                    <img src="../assets/images/avatar/<?= $usr['avatar'] ?>" alt="" width="100px" />
                    <?php } else {  ?>
                    <img src="../assets/images/faces-clipart/pic-4.png" alt="" width="100px" />
                    <?php } ?>
                    <span class="login-status online"></span>
                    <!--change to offline or busy as needed-->
                </div>
                <div class="nav-profile-text d-flex flex-column">
                    <span class="font-weight-bold mb-2">
                        <?= $usr['name']; ?>
                    </span>
                    <span class="text-secondary text-small">
                        <?= $usr['roles']; ?>
                    </span>
                </div>
                <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= $baseurl ?>/dashboard/">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<?= $baseurl ?>/pages/profile.php?patientid=<?= $usr['patient_id'] ?>">
                <span class="menu-title">Profile</span>
                <i class=" mdi mdi-account-circle menu-icon"></i>
            </a>
        </li>
        <!-- Patien -->
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic1" aria-expanded="false"
                aria-controls="ui-basic">
                <span class="menu-title">Appointment</span>
                <i class="menu-arrow"></i>
                <i class="mdi mdi-account-circle menu-icon"></i>
            </a>
            <div class="collapse" id="ui-basic1">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item">
                        <a class="nav-link"
                            href="<?= $baseurl ?>/pages/makeappointment.php?patientId=<?= $usr['patient_id'] ?>">
                            Make Appointment
                        </a>
                    </li>
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/pages/appointmented.php?patientId=<?= $usr['patient_id'] ?>">Appointment
                            List</a>
                    </li>
                    <li class="nav-item"> <a class="nav-link"
                            href="<?= $baseurl ?>/pages/pending-appointmented.php">Pending Appointment
                            List</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
<?php } ?>
<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class=" d-flex p-4 m-2 text-center text-decoration-none" href="<?=$baseurl?>">
            <img src="../assets/images/hospital-sign.png" alt="logo" width="50px" class="mt-2"
                style="width: 35px;height:30px" />
            <h1 class="pt-2" style="font-weight:bolder;font-size:1.6rem; color:#e01111;">HOSPITAL</h1>
        </a>

        <!-- <a class="navbar-brand brand-logo-mini" href="index.html"><img src="../assets/images/logo-mini.svg" alt="logo" /></a> -->
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
        </button>
        <div class="search-field d-none d-md-block">
            <form class="d-flex align-items-center h-100" action="#">
                <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                        <i class="input-group-text border-0 mdi mdi-magnify"></i>
                    </div>
                    <input type="text" class="form-control bg-transparent border-0" placeholder="Search projects">
                </div>
            </form>
        </div>
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    <div class="nav-profile-img">
                        <?php if($usr['avatar']!== null){ ?>
                        <img src="../assets/images/avatar/<?= $usr['avatar'] ?>" alt="" width="100px" />
                        <?php }else{  ?>
                        <img src="../assets/images/faces-clipart/pic-4.png" alt="" width="100px" />
                        <?php } ?>
                        <span class="availability-status online"></span>
                    </div>
                    <div class="nav-profile-text">
                        <p class="mb-1 text-black"><?= $usr['name'] ?></p>
                    </div>
                </a>
                <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="nav-link" href="<?=$baseurl?>/pages/profile.php?id=<?=$usr['id'] ?>"> <i
                            class="mdi mdi-cached me-2 text-success"></i> Account Settings</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<?= $baseurl ?>/include/signout.php">
                        <i class="mdi mdi-logout me-2 text-primary"></i> Signout </a>
                </div>
            </li>
            <li class="nav-item d-none d-lg-block full-screen-link">
                <a class="nav-link">
                    <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
                </a>
            </li>
            <li class="nav-item nav-logout d-none d-lg-block">
                <a class="nav-link" href="<?= $baseurl ?>/include/signout.php">
                    <i class="mdi mdi-power"></i>
                </a>
            </li>
            <li class="nav-item nav-settings d-none d-lg-block">
                <a class="nav-link" href="#">
                    <i class="mdi mdi-format-line-spacing"></i>
                </a>
            </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
            data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
        </button>
    </div>
</nav>
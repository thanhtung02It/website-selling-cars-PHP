<header>
  <div class="default-header">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-2">
          <div class="logo"> <a href="index.php"><img src="assets/images/logo.png" alt="image" /></a> </div>
        </div>
        <div class="col-sm-9 col-md-10">
          <div class="header_info">
            <?php
            $sql = "SELECT EmailId,ContactNo from tblcontactusinfo";
            $query = $dbh->prepare($sql);
            $query->execute();
            $results = $query->fetchAll(PDO::FETCH_OBJ);
            foreach ($results as $result) {
              $email = $result->EmailId;
              $contactno = $result->ContactNo;
            }
            ?>

            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-envelope" aria-hidden="true"></i> </div>
              <p class="uppercase_text">Để được hỗ trợ gửi thư cho chúng tôi: </p>
              <a href="mailto:<?php echo htmlentities($email); ?>">
                <?php echo htmlentities($email); ?>
              </a>
            </div>
            <div class="header_widgets">
              <div class="circle_icon"> <i class="fa fa-phone" aria-hidden="true"></i> </div>
              <p class="uppercase_text">Đường dây trợ giúp dịch vụ Gọi cho chúng tôi:</p>
              <a href="tel:<?php echo htmlentities($contactno); ?>">
                <?php echo htmlentities($contactno); ?>
              </a>
            </div>
            <div class="social-follow">

            </div>
            <?php if (strlen($_SESSION['login']) == 0) {
              ?>
              <div class="login_btn"> <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal"
                  data-dismiss="modal">Đăng nhập / Đăng ký</a> </div>
            <?php } else {

              echo "Welcome To TTV Car";
            } ?>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Navigation -->
  <nav id="navigation_bar" class="navbar navbar-default">
    <div class="container">
      <div class="navbar-header">
        <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse"
          class="navbar-toggle collapsed" type="button"> <span class="sr-only">Chuyển đổi điều hướng thành</span> <span
            class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="header_wrap">
        <div class="user_login">
          <ul>
            <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
                  class="fa fa-user-circle" aria-hidden="true"></i>
                <?php
                $email = $_SESSION['login'];
                $sql = "SELECT FullName FROM tblusers WHERE EmailId=:email ";
                $query = $dbh->prepare($sql);
                $query->bindParam(':email', $email, PDO::PARAM_STR);
                $query->execute();
                $results = $query->fetchAll(PDO::FETCH_OBJ);
                if ($query->rowCount() > 0) {
                  foreach ($results as $result) {

                    echo htmlentities($result->FullName);
                  }
                } ?>
                <i class="fa fa-angle-down" aria-hidden="true"></i>
              </a>
              <ul class="dropdown-menu">
                <?php if ($_SESSION['login']) { ?>
                  <li><a href="profile.php">Cài đặt hồ sơ</a></li>
                  <li><a href="update-password.php">Cập nhật mật khẩu</a></li>
                  <li><a href="my-booking.php">Lịch xem xe của tôi </a></li>
                  <li><a href="post-testimonial.php">Gửi một đánh giá</a></li>
                  <li><a href="my-testimonials.php">Đánh giá của tôi</a></li>
                  <li><a href="logout.php">Đăng xuất</a></li>
                <?php } ?>
              </ul>
            </li>
          </ul>
        </div>
        <div class="header_search">
          <div id="search_toggle"><i class="fa fa-search" aria-hidden="true"></i></div>
          <form action="search.php" method="post" id="header-search-form">
            <input type="text" placeholder="Search..." name="searchdata" class="form-control" required="true">
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
          </form>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navigation">
        <ul class="nav navbar-nav">
          <li><a href="index.php">Trang chủ</a> </li>

          <li><a href="page.php?type=aboutus">Về chúng tôi</a></li>
          <li><a href="car-listing.php">Danh sách xe</a>
          <li><a href="page.php?type=faqs">Câu hỏi thường gặp</a></li>
          <li><a href="contact-us.php">Liên hệ chúng tôi</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation end -->

</header>
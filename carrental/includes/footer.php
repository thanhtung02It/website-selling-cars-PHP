<?php
if (isset($_POST['emailsubscibe'])) {
  $subscriberemail = $_POST['subscriberemail'];
  $sql = "SELECT SubscriberEmail FROM tblsubscribers WHERE SubscriberEmail=:subscriberemail";
  $query = $dbh->prepare($sql);
  $query->bindParam(':subscriberemail', $subscriberemail, PDO::PARAM_STR);
  $query->execute();
  $results = $query->fetchAll(PDO::FETCH_OBJ);
  $cnt = 1;
  if ($query->rowCount() > 0) {
    echo "<script>alert('Đã theo dõi !.');</script>";
  } else {
    $sql = "INSERT INTO  tblsubscribers(SubscriberEmail) VALUES(:subscriberemail)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':subscriberemail', $subscriberemail, PDO::PARAM_STR);
    $query->execute();
    $lastInsertId = $dbh->lastInsertId();
    if ($lastInsertId) {
      echo "<script>alert('Đăng kí thành công.');</script>";
    } else {
      echo "<script>alert('Vui lòng thử lại!');</script>";
    }
  }
}
?>

<footer>
  <div class="footer-top">
    <div class="container">
      <div class="row">

        <div class="col-md-6">
          <h6>Về chúng tôi</h6>
          <ul>
            <li><a href="page.php?type=aboutus">Về chúng tôi</a></li>
            <li><a href="page.php?type=faqs">Câu hỏi thường gặp</a></li>
            <li><a href="page.php?type=privacy">Quyền riêng tư và chính sách </a></li>
            <li><a href="page.php?type=terms">Điều khoản sử dụng</a></li>
            <li><a href="admin/">Đăng nhập quản trị viên</a></li>
          </ul>
        </div>

        <div class="col-md-3 col-sm-6">
          <h6>Theo dõi bản tin</h6>
          <div class="newsletter-form">
            <form method="post">
              <div class="form-group">
                <input type="email" name="subscriberemail" class="form-control newsletter-input" required
                  placeholder="Nhập địa chỉ Email" />
              </div>
              <button type="submit" name="emailsubscibe" class="btn btn-block">Theo dõi <span class="angle_arrow"><i
                    class="fa fa-angle-right" aria-hidden="true"></i></span></button>
            </form>
            <p class="subscribed-text">*Chúng tôi gửi những ưu đãi tuyệt vời và tin tức ô tô mới nhất đến người dùng đã
              đăng kí theo dõi của chúng tôi hàng tuần.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-push-6 text-right">
          <div class="footer_widget">
            <p>Kết nối với chúng tôi:</p>
            <ul>
              <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
              <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
              <li><a href="#"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
              <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 col-md-pull-6">
          <p class="copy-right"> &copy; 2023 TTV Car. All Rights Reserved</p>
        </div>
      </div>
    </div>
  </div>
</footer>
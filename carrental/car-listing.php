<?php
session_start();
include('includes/config.php');
error_reporting(0);
?>

<!DOCTYPE HTML>
<html lang="en">

<head>

  <title>TTV Car| Danh sách xe</title>
  <!--Bootstrap -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
  <!--Custome Style -->
  <link rel="stylesheet" href="assets/css/style.css" type="text/css">
  <!--OWL Carousel slider-->
  <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
  <link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
  <!--slick-slider -->
  <link href="assets/css/slick.css" rel="stylesheet">
  <!--bootstrap-slider -->
  <link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
  <!--FontAwesome Font Style -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">

  <!-- SWITCHER -->
  <link rel="stylesheet" id="switcher-css" type="text/css" href="assets/switcher/css/switcher.css" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/red.css" title="red" media="all"
    data-default-color="true" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/orange.css" title="orange" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/blue.css" title="blue" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/pink.css" title="pink" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/green.css" title="green" media="all" />
  <link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/purple.css" title="purple" media="all" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144"
    href="assets/images/favicon-icon/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114"
    href="assets/images/favicon-icon/apple-touch-icon-114-precomposed.html">
  <link rel="apple-touch-icon-precomposed" sizes="72x72"
    href="assets/images/favicon-icon/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="assets/images/favicon-icon/apple-touch-icon-57-precomposed.png">
  <link rel="shortcut icon" href="assets/images/favicon-icon/favicon.png">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
  <style>
    body {
      font-family: Roboto;
    }
    /* CSS cho phân trang */
.pagination {
  margin-top: 20px;
  text-align: center;
}

.pagination a {
  display: inline-block;
  padding: 6px 12px;
  margin: 0 3px;
  border: 1px solid #ccc;
  text-decoration: none;
  color: #333;
}

.pagination a:hover {
  background-color: #337ab7;
  color: #fff;
}

.pagination .current,
.pagination .current:hover {
  background-color: #337ab7;
  color: #fff;
  cursor: default;
}

  </style>
</head>

<body>

  <!-- Start Switcher -->
  <?php include('includes/colorswitcher.php'); ?>
  <!-- /Switcher -->

  <!--Header-->
  <?php include('includes/header.php'); ?>
  <!-- /Header -->

  <!--Page Header-->
  <section class="page-header listing_page">
    <div class="container">
      <div class="page-header_wrap">
        <div class="page-heading">
          <h1>Danh sách xe</h1>
        </div>
        <ul class="coustom-breadcrumb">
          <li><a href="#">Trang chủ</a></li>
          <li>Danh sách xe</li>
        </ul>
      </div>
    </div>
    <!-- Dark Overlay-->
    <div class="dark-overlay"></div>
  </section>
  <!-- /Page Header-->

  <!--Listing-->
  <section class="listing-page">
    <div class="container">
      <div class="row">
      <?php
$per_page = 5;// Soó xe hiển thị trên 1 trang
$current_page = isset($_GET['page']) ? $_GET['page'] : 1;
$offset = ($current_page - 1) * $per_page;

$sql_count = "SELECT COUNT(id) as total FROM tblvehicles";
$query_count = $dbh->prepare($sql_count);
$query_count->execute();
$row = $query_count->fetch(PDO::FETCH_ASSOC);
$total_pages = ceil($row['total'] / $per_page);

$sql = "SELECT tblvehicles.*, tblbrands.BrandName, tblbrands.id as bid FROM tblvehicles JOIN tblbrands ON tblbrands.id=tblvehicles.VehiclesBrand LIMIT $per_page OFFSET $offset";
$query = $dbh->prepare($sql);
$query->execute();
$results = $query->fetchAll(PDO::FETCH_OBJ);
?>
        <div class="col-md-9 col-md-push-3">
    <div class="result-sorting-wrapper">
        <div class="sorting-count">
            <p><span><?php echo htmlentities($row['total']); ?> xe được hiển thị!</span></p>
        </div>
    </div>

    <?php foreach ($results as $result) { ?>
        <div class="product-listing-m gray-bg">
            <div class="product-listing-img">
                <img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1); ?>" class="img-responsive" alt="Image" />
            </div>
            <div class="product-listing-content">
                <h5><a href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>">
                        <?php echo htmlentities($result->BrandName); ?> ,
                        <?php echo htmlentities($result->VehiclesTitle); ?>
                    </a></h5>
                <p class="list-price">
                <?php echo htmlentities(number_format($result->PricePerDay, 0, ',', '.')); ?>VND
                </p>
                <ul>
                    <li><i class="fa fa-user" aria-hidden="true"></i>
                        <?php echo htmlentities($result->SeatingCapacity); ?> Chỗ ngồi
                    </li>
                    <li><i class="fa fa-calendar" aria-hidden="true"></i>
                        <?php echo htmlentities($result->ModelYear); ?>
                    </li>
                    <li><i class="fa fa-car" aria-hidden="true"></i>
                        <?php echo htmlentities($result->FuelType); ?>
                    </li>
                </ul>
                <a href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>" class="btn">Xem chi tiết <span class="angle_arrow"><i class="fa fa-angle-right" aria-hidden="true"></i></span></a>
            </div>
        </div>
    <?php } ?>

    <!-- Hiển thị các liên kết trang -->
    <div class="pagination">
    <?php for ($page = 1; $page <= $total_pages; $page++) {
        $current_class = ($page == $current_page) ? 'current' : '';
        echo '<a href="car-listing.php?page=' . $page . '" class="' . $current_class . '">' . $page . '</a> ';
    } ?>
</div>
</div>

        <!--Side-Bar-->
        <aside class="col-md-3 col-md-pull-9">
          <div class="sidebar_widget">
            <div class="widget_heading">
              <h5><i class="fa fa-filter" aria-hidden="true"></i> Tìm kiếm xe bạn muốn </h5>
            </div>
            <div class="sidebar_filter">
              <form action="search-carresult.php" method="post">
                <div class="form-group select">
                <select class="form-control" name="brand">
                  <option>Chọn thương hiệu</option>

                  <?php $sql = "SELECT * from  tblbrands ";
                  $query = $dbh->prepare($sql);
                  $query->execute();
                  $results = $query->fetchAll(PDO::FETCH_OBJ);
                  $cnt = 1;
                  if ($query->rowCount() > 0) {
                    foreach ($results as $result) { ?>  
<option value="<?php echo htmlentities($result->id); ?>"><?php echo htmlentities($result->BrandName); ?></option>
<?php }
                  } ?>
                 
                </select>
              </div>
              <div class="form-group select">
                <select class="form-control" name="fueltype">
                  <option>Chọn loại nhiên liệu</option>
                  <option option value="Xăng">Xăng</option>
                  <option value="Diesel">Diesel</option>
                  <option value="CNG">CNG</option>
                </select>
              </div> 

                 <div class="form-group">
                <button type="submit" class="btn btn-block"><i class="fa fa-search" aria-hidden="true"></i> Tìm kiếm xe</button>
              </div>
            </form>
          </div>
        </div> 
                <div class="sidebar_widget">
                  <div class="widget_heading">
                    <h5><i class="fa fa-car" aria-hidden="true"></i> Xe được tìm kiếm gần đây</h5>
                  </div>
                  <div class="recent_addedcars">
                    <ul>
                      <?php $sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand order by id desc limit 4";
                      $query = $dbh->prepare($sql);
                      $query->execute();
                      $results = $query->fetchAll(PDO::FETCH_OBJ);
                      $cnt = 1;
                      if ($query->rowCount() > 0) {
                        foreach ($results as $result) { ?>

                          <li class="gray-bg">
                            <div class="recent_post_img"> <a
                                href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>"><img
                                  src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1); ?>"
                                  alt="image"></a> </div>
                            <div class="recent_post_title"> <a
                                href="vehical-details.php?vhid=<?php echo htmlentities($result->id); ?>">
                                <?php echo htmlentities($result->BrandName); ?> ,
                                <?php echo htmlentities($result->VehiclesTitle); ?>
                              </a>
                              <p class="widget_price">
                              <?php echo htmlentities(number_format($result->PricePerDay, 0, ',', '.')); ?>VND
                              </p>
                            </div>
                          </li>
                        <?php }
                      } ?>

                    </ul>
                  </div>
                </div>
        </aside>
        <!--/Side-Bar-->
      </div>
    </div>
  </section>
  <!-- /Listing-->

  <!--Footer -->
  <?php include('includes/footer.php'); ?>
  <!-- /Footer-->

  <!--Back to top-->
  <div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
  <!--/Back to top-->

  <!--Login-Form -->
  <?php include('includes/login.php'); ?>
  <!--/Login-Form -->

  <!--Register-Form -->
  <?php include('includes/registration.php'); ?>

  <!--/Register-Form -->

  <!--Forgot-password-Form -->
  <?php include('includes/forgotpassword.php'); ?>

  <!-- Scripts -->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/interface.js"></script>
  <!--Switcher-->
  <script src="assets/switcher/js/switcher.js"></script>
  <!--bootstrap-slider-JS-->
  <script src="assets/js/bootstrap-slider.min.js"></script>
  <!--Slider-JS-->
  <script src="assets/js/slick.min.js"></script>
  <script src="assets/js/owl.carousel.min.js"></script>

</body>

</html>
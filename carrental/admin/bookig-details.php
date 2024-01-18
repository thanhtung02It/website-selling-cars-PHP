<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {
	if (isset($_REQUEST['eid'])) {
		$eid = intval($_GET['eid']);
		$status = "2";
		$sql = "UPDATE tblbooking SET Status=:status WHERE  id=:eid";
		$query = $dbh->prepare($sql);
		$query->bindParam(':status', $status, PDO::PARAM_STR);
		$query->bindParam(':eid', $eid, PDO::PARAM_STR);
		$query->execute();
		echo "<script>alert('Đã hủy đặt lịch thành công');</script>";
		echo "<script type='text/javascript'> document.location = 'canceled-bookings.php; </script>";
	}
	if (isset($_REQUEST['aeid'])) {
		$aeid = intval($_GET['aeid']);
		$status = 1;

		$sql = "UPDATE tblbooking SET Status=:status WHERE  id=:aeid";
		$query = $dbh->prepare($sql);
		$query->bindParam(':status', $status, PDO::PARAM_STR);
		$query->bindParam(':aeid', $aeid, PDO::PARAM_STR);
		$query->execute();
		echo "<script>alert('Lịch xem đã được xác nhận thành công !');</script>";
		echo "<script type='text/javascript'> document.location = 'confirmed-bookings.php'; </script>";
	}

	?>

	<!doctype html>
	<html lang="en" class="no-js">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="theme-color" content="#3e454c">

		<title>TTV Car| Lịch xem mới </title>

		<!-- Font awesome -->
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- Sandstone Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Bootstrap Datatables -->
		<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
		<!-- Bootstrap social button library -->
		<link rel="stylesheet" href="css/bootstrap-social.css">
		<!-- Bootstrap select -->
		<link rel="stylesheet" href="css/bootstrap-select.css">
		<!-- Bootstrap file input -->
		<link rel="stylesheet" href="css/fileinput.min.css">
		<!-- Awesome Bootstrap checkbox -->
		<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
		<!-- Admin Stye -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="shortcut icon" href="../assets/images/favicon-icon/favicon.png">
		<style>
			.errorWrap {
				padding: 10px;
				margin: 0 0 20px 0;
				background: #fff;
				border-left: 4px solid #dd3d36;
				-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
			}

			.succWrap {
				padding: 10px;
				margin: 0 0 20px 0;
				background: #fff;
				border-left: 4px solid #5cb85c;
				-webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
			}
		</style>

	</head>

	<body>
		<?php include('includes/header.php'); ?>

		<div class="ts-main-content">
			<?php include('includes/leftbar.php'); ?>
			<div class="content-wrapper">
				<div class="container-fluid">

					<div class="row">
						<div class="col-md-12">

							<h2 class="page-title">Chi tiết lịch xem</h2>

							<!-- Zero Configuration Table -->
							<div class="panel panel-default">
								<div class="panel-heading">Thông tin người đặt lịch</div>
								<div class="panel-body">


									<div id="print">
										<table border="1" class="display table table-striped table-bordered table-hover"
											cellspacing="0" width="100%">

											<tbody>

												<?php
												$bid = intval($_GET['bid']);
												$sql = "SELECT tblusers.*,tblbrands.BrandName,tblvehicles.VehiclesTitle,tblbooking.FromDate,tblbooking.ToDate,tblbooking.message,tblbooking.VehicleId as vid,tblbooking.Status,tblbooking.PostingDate,tblbooking.id,tblbooking.BookingNumber,tblvehicles.PricePerDay
									  			from tblbooking join tblvehicles on tblvehicles.id=tblbooking.VehicleId join tblusers on tblusers.EmailId=tblbooking.userEmail join tblbrands on tblvehicles.VehiclesBrand=tblbrands.id where tblbooking.id=:bid";
												$query = $dbh->prepare($sql);
												$query->bindParam(':bid', $bid, PDO::PARAM_STR);
												$query->execute();
												$results = $query->fetchAll(PDO::FETCH_OBJ);
												$cnt = 1;
												if ($query->rowCount() > 0) {
													foreach ($results as $result) { ?>
														<h3 style="text-align:center; color:red">#
															<?php echo htmlentities($result->BookingNumber); ?> Chi tiết lịch xem
														</h3>

														<tr>
															<th colspan="4" style="text-align:center;color:blue">Chi tiết người dùng
															</th>
														</tr>
														<tr>
															<th>Lịch đặt số.</th>
															<td>#
																<?php echo htmlentities($result->BookingNumber); ?>
															</td>
															<th>Họ tên</th>
															<td>
																<?php echo htmlentities($result->FullName); ?>
															</td>
														</tr>
														<tr>
															<th>Email Id</th>
															<td>
																<?php echo htmlentities($result->EmailId); ?>
															</td>
															<th>Liên lạc</th>
															<td>
																<?php echo htmlentities($result->ContactNo); ?>
															</td>
														</tr>
														<tr>
															<th>Địa chỉ</th>
															<td>
																<?php echo htmlentities($result->Address); ?>
															</td>
															<th>Thành phố</th>
															<td>
																<?php echo htmlentities($result->City); ?>
															</td>
														</tr>
														<tr>
															<th>Quốc gia</th>
															<td colspan="3">
																<?php echo htmlentities($result->Country); ?>
															</td>
														</tr>

														<tr>
															<th colspan="4" style="text-align:center;color:blue">Chi tiết đặt lịch
															</th>
														</tr>
														<tr>
															<th>Tên xe</th>
															<td><a
																	href="edit-vehicle.php?id=<?php echo htmlentities($result->vid); ?>">
																	<?php echo htmlentities($result->BrandName); ?> ,
																	<?php echo htmlentities($result->VehiclesTitle); ?>
															</td>
															<th>Ngày đặt lịch</th>
															<td>
																<?php echo htmlentities($result->PostingDate); ?>
															</td>
														</tr>
														<tr>
															<th>Từ ngày</th>
															<td>
																<?php echo htmlentities($result->FromDate); ?>
															</td>
															<th>Đến ngày</th>
															<td>
																<?php echo htmlentities($result->ToDate); ?>
															</td>
														</tr>
														<tr>
															<th>Thuế (10%) </th>
															<td>
																<?php $tdays = ($result->PricePerDay) * 10 / 100; // Tính 10% giá
																			$formattedPrice = number_format($tdays, 0, ',', '.'); // Định dạng số với dấu phân cách hàng nghìn		
																			echo htmlentities($formattedPrice); ?>
															</td>
															<th>Giá niêm yết</th>
															<td>
																<?php
																$ppdays = ($result->PricePerDay);
																$formatPrice = number_format($ppdays, 0, ',', '.'); // Định dạng số với dấu phân cách hàng nghìn
																echo htmlentities($formatPrice);
																?>
															</td>
														</tr>
														<tr>
															<th colspan="3" style="text-align:center">Tổng tiền</th>
															<td>
																<?php echo htmlentities(number_format(($tdays + $ppdays), 0, ',', '.')); ?>
																(VND)
															</td>
														</tr>
														<tr>
															<th>Tình trạng đặt lịch xem xe</th>
															<td>
																<?php
																if ($result->Status == 0) {
																	echo htmlentities('Chưa xác nhận');
																} else if ($result->Status == 1) {
																	echo htmlentities('Đã xác nhận');
																} else {
																	echo htmlentities('Đã huỷ');
																}
																?>
															</td>
															<th>Ngày cập nhật cuối cùng</th>
															<td>
																<?php echo htmlentities($result->LastUpdationDate); ?>
															</td>
														</tr>

														<?php if ($result->Status == 0) { ?>
															<tr>
																<td style="text-align:center" colspan="4">
																	<a href="bookig-details.php?aeid=<?php echo htmlentities($result->id); ?>"
																		onclick="return confirm('Bạn có thực sự muốn Xác nhận đặt lịch không')"
																		class="btn btn-primary"> Xác nhận đặt lịch</a>

																	<a href="bookig-details.php?eid=<?php echo htmlentities($result->id); ?>"
																		onclick="return confirm('Bạn có thực sự muốn huỷ đặt lịch không')"
																		class="btn btn-danger"> Huỷ đặt lịch</a>
																</td>
															</tr>
														<?php } ?>
														<?php $cnt = $cnt + 1;
													}
												} ?>

											</tbody>
										</table>
										<form method="post">
											<input name="Submit2" type="submit" class="txtbox4" value="In"
												onClick="return f3();" style="cursor: pointer;" />
										</form>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- Loading Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/bootstrap-select.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/jquery.dataTables.min.js"></script>
			<script src="js/dataTables.bootstrap.min.js"></script>
			<script src="js/Chart.min.js"></script>
			<script src="js/fileinput.js"></script>
			<script src="js/chartData.js"></script>
			<script src="js/main.js"></script>
			<script language="javascript" type="text/javascript">
				function f3() {
					window.print();
				}
			</script>
	</body>

	</html>
<?php } ?>
<%@ page import="java.net.InetAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Git Hub API Tool</title>
<meta charset="utf-8">

<!-- VENDOR CSS -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css">

<script
	src="${pageContext.request.contextPath}/assets/js/libscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/site.min.css">
<script
	src="${pageContext.request.contextPath}/assets/js/vendorscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/flotscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/mainscripts.bundle.js"></script>


</head>
<body class="theme-cyan font-krub">

	<div id="wrapper">
		<nav class="navbar navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-left h1text">
					<h1>GIT HUB DEMO API</h1>
				</div>
				<div class="navbar-left"></div>
				<div class="navbar-right">
					<div id="navbar-menu">
						<ul class="nav navbar-nav">
							<li><a href="#" class="icon-menu"
								onclick="location.href='${pageContext.request.contextPath}/api/logout'">Logout
									<i class="icon-power"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>

		</nav>
		<div id="left-sidebar" class="sidebar">
			<div class="navbar-brand">

				<img
					src="${pageContext.request.contextPath}/assets/images/Yantriks-Logo.png"
					alt=" Logo" class="img-fluid logo">

				<button type="button"
					class="btn-toggle-offcanvas btn btn-sm float-right">
					<i class="lnr lnr-menu fa fa-chevron-circle-left"></i>
				</button>
			</div>
			<div class="sidebar-scroll">
				<div class="user-account">
					<div class="dropdown"></div>
				</div>
				<nav id="left-sidebar-nav" class="sidebar-nav">
					<ul id="main-menu" class="metismenu">
						<li><a href="${pageContext.request.contextPath}/api/home"
							class=""><i class="icon-home"></i>Home</a></li>

						<li><a href="${pageContext.request.contextPath}/api/search"
							class=""><i class="icon-book-open"></i>Search Topic</a></li>
						<li><a href="${pageContext.request.contextPath}/api/reports"><i
								class="fa fa-server"></i>Search Reports</a></li>

					</ul>
				</nav>
			</div>
		</div>
		<div id="main-content">
			<div class="block-header">
				<div class="row clearfix">
					<div class="col-md-12 col-sm-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Generate
										Reports</a></li>

							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="container-fluid pdad">
				<div class="row clearfix">
					<div class="col-lg-12">
						<div class="card">
							<div class="body">
								<div class="row clearfix">
									<div class="col-12">
										<div class="table-responsive">
										 <form:form method="post"  action="${pageContext.request.contextPath}/api/getsearchHistory">
											<table class="table table-hover table-custom spacing8">
												<tr>
													<td>Start Date: <input type="text"
														id="startdatetimepicker" name="startdatetimepicker" required="required"></td>
													<td>End Date: <input type="text"
														id="enddatetimepicker" name="enddatetimepicker" required="required"></td>
													<td><input name="submit" type="submit"
														class="btn btn-lg btn-primary" value="Submit" /></td>
												</tr>

											</table>
											</form:form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#startdatetimepicker").datetimepicker();
		});
	</script>

	<script>
		$(function() {
			$("#enddatetimepicker").datetimepicker();
		});
	</script>

	<script type="text/javascript">
		var startDate;
		$("#startdatetimepicker").datetimepicker({
			timepicker : true,
			closeOnDateSelect : false,
			closeOnTimeSelect : true,
			initTime : true,
			format : 'd-m-Y H:m',
			minDate : 0,
			roundTime : 'ceil',
			onChangeDateTime : function(dp, $input) {
				startDate = $("#startdatetimepicker").val();
			}
		});
		$("#enddatetimepicker").datetimepicker({
			timepicker : true,
			closeOnDateSelect : false,
			closeOnTimeSelect : true,
			initTime : true,
			format : 'd-m-Y H:m',
			onClose : function(current_time, $input) {
				var endDate = $("#enddatetimepicker").val();
				if (startDate > endDate) {
					$('#enddatetimepicker').val("");
				}
			}
		});
	</script>
</body>

</html>
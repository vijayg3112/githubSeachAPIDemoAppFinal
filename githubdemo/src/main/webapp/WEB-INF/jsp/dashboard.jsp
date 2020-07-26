<%@ page import="java.net.InetAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>

<title>Git Hub API Tool</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/vivify.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/c3.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css//chartist.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/chartist-plugin-tooltip.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/toastr.min.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/site.min.css">
<style type="text/css">
.table.table-custom.spacing8 {
	border-spacing: 0px 0px !important;
}

.green {
	background-color: green;
}

.red {
	background-color: red;
}

.orange {
	background-color: orange;
}

.blink {
	animation: blink 2s steps(5, start) infinite;
	-webkit-animation: blink 1s steps(5, start) infinite;
}

@
keyframes blink {to { visibility:hidden;
	
}

}
@
-webkit-keyframes blink {to { visibility:hidden;
	
}

}
.button {
	/*  background-color: #4CAF50;*/
	border: none;
	color: white;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 3px;
	margin: 4px 2px;
}

.button5 {
	border-radius: 50%;
}
</style>

<style>
.linkwrap {
	position: relative;
	display: inline-block;
}

.blocker {
	position: absolute;
	height: 100%;
	width: 100%;
	z-index: 1;
}

.linkwrap iframe {
	z-index: 2;
}
</style>
</head>
<body class="theme-cyan font-krub">
	<!-- Page Loader -->
	<div class="page-loader-wrapper">
		<div class="loader">
			<div class="bar1"></div>
			<div class="bar2"></div>
			<div class="bar3"></div>
			<div class="bar4"></div>
			<div class="bar5"></div>
		</div>
	</div>
	<!-- Overlay For Sidebars -->
	<div class="overlay"></div>
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
			<div class="progress-container">
				<div class="progress-bar" id="myBar"></div>
			</div>
		</nav>
	</div>
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

				<div class="dropdown">

					<!-- <a href="javascript:void(0);" class=" user-name" data-toggle="dropdown"><strong>Gangesh Clover</strong></a> -->

				</div>
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
							<li class="breadcrumb-item"><a href="#">HOME</a></li>

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
										<table class="table table-hover table-custom spacing8">


											<h2>Welcome To Home Page </h2>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="addBookDialog" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<p>IP Address</p>
					<input type="text" name="bookId" id="bookId" value=""
						class="form-control" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Javascript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/libscripts.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/vendorscripts.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/flotscripts.bundle.js"></script>
	<!-- flot charts Plugin Js -->
	<script src="${pageContext.request.contextPath}/assets/js/c3.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/chartist.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/knob.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/toastr.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/mainscripts.bundle.js"></script>

</body>
<script type="text/javascript">
	$(document).on("click", ".open-AddBookDialog", function() {
		var myBookId = $(this).data('id');
		$(".modal-body #bookId").val(myBookId);
		$('#addBookDialog').modal('show');
	});
</script>
</html>
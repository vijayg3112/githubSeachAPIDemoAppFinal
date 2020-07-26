<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<link crossorigin="anonymous" media="all"
	integrity="sha512-YR0i2ZAJ3fFf7L2CvMny+FWH76iHZNNIcD1YX57o4cdBHev8ffMXOfzy5F/lpBJpLttwPahk3zY/8XXaRH12ew=="
	rel="stylesheet"
	href="https://github.githubassets.com/assets/frameworks-611d22d99009ddf15fecbd82bcc9f2f8.css" />
<link crossorigin="anonymous" media="all"
	integrity="sha512-37pLQI8klDWPjWVVWFB9ITJLwVTTkp3Rt4bVf+yixrViURK9OoGHEJDbTLxBv/rTJhsLm8pb00H2H5AG3hUJfg=="
	rel="stylesheet"
	href="https://github.githubassets.com/assets/site-dfba4b408f2494358f8d655558507d21.css" />
<link crossorigin="anonymous" media="all"
	integrity="sha512-4o1xIA/PmlufOl2Ed/z8wJq9aqX8UXt666MRH7j/EpEqls4mXQIC5CZanvIxSMf0TOE4Q+MxxRHeWk8bop915Q=="
	rel="stylesheet"
	href="https://github.githubassets.com/assets/github-e28d71200fcf9a5b9f3a5d8477fcfcc0.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

						<!--  <a href="javascript:void(0);"
							class=" user-name" data-toggle="dropdown"><strong>Gangesh
								Clover</strong></a> -->
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
								<li class="breadcrumb-item"><a href="#">Faster Topic Search API</a></li>

							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div id="js-flash-container">
				<template class="js-flash-template">
				<div class="flash flash-full  js-flash-template-container">
					<div class="container-lg px-2">
						<button class="flash-close js-flash-close" type="button"
							aria-label="Dismiss this message">
							<svg class="octicon octicon-x" viewBox="0 0 16 16" version="1.1"
								width="16" height="16" aria-hidden="true">
						<path fill-rule="evenodd"
									d="M3.72 3.72a.75.75 0 011.06 0L8 6.94l3.22-3.22a.75.75 0 111.06 1.06L9.06 8l3.22 3.22a.75.75 0 11-1.06 1.06L8 9.06l-3.22 3.22a.75.75 0 01-1.06-1.06L6.94 8 3.72 4.78a.75.75 0 010-1.06z"></path></svg>
						</button>

						<div class="js-flash-template-message"></div>

					</div>
				</div>
				</template>
			</div>
			<div class="container-lg">
				<div class="py-6 my-6 px-4 px-md-6 mx-md-6">

					<form id="search_form" class="search_repos my-3" action="/result"
						accept-charset="UTF-8" method="get">
						<div class="d-flex search-form-fluid flex-column flex-sm-row">
							<div class="flex-auto position-relative">
								<input aria-label="Search GitHub" autocapitalize="off"
									autocomplete="off" autofocus class="form-control input-block"
									data-hotkey="s" name="searchQuery" placeholder="Search GitHub"
									spellcheck="false" type="text" required>
							</div>
							<button class="btn ml-sm-2 mt-2 mt-sm-0" type="submit">Search</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>



<!-- Javascript -->
<script
	src="${pageContext.request.contextPath}/assets/js/libscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/vendorscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/mindmup-editabletable.js"></script>
<!-- Editable Table Plugin Js -->
<!-- flot charts Plugin Js -->
<script
	src="${pageContext.request.contextPath}/assets/js/mainscripts.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/editable-table.js"></script>

</body>
</html>
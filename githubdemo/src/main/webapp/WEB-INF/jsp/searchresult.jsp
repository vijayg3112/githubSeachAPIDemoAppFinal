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
											<table class="table table-hover table-custom spacing8">
												<c:set value="${itemList}" var="itemsPageList" />
												<thead>
													<tr>
														<th style="background: #004c6d; color: #fff;"><b>
																Name</b></th>
														<th style="background: #004c6d; color: #fff;"><b>Description</b></th>
														<th style="background: #004c6d; color: #fff;"><b>Created
																By</b></th>
														<th style="background: #004c6d; color: #fff;"><b>Released</b></th>
														<th style="background: #004c6d; color: #fff;"><b>Created
																At</b></th>
														<th style="background: #004c6d; color: #fff;"><b>Updated
																At</b></th>
													</tr>
												</thead>
												<c:forEach items="${itemsPageList.pageList}" var="item">
													<tr>
														<td>${item.name}</td>
														<td>${item.short_description}</td>
														<td>${item.created_by}</td>
														<td>${item.released}</td>
														<td>${item.created_at}</td>
														<td>${item.updated_at}</td>
													</tr>
												</c:forEach>
											</table>
											<c:choose>
												<%-- Show Prev as link if not on first page --%>
												<c:when test="${itemsPageList.firstPage}">
													<span>Prev</span>
												</c:when>
												<c:otherwise>
													<c:url value="/result/prev" var="url" />
													<a href='<c:out value="${url}" />'>Prev</a>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="1" end="${itemsPageList.pageCount}"
												step="1" varStatus="tagStatus">
												<c:choose>
													<%-- In PagedListHolder page count starts from 0 --%>
													<c:when
														test="${(itemsPageList.page + 1) == tagStatus.index}">
														<span>${tagStatus.index}</span>
													</c:when>
													<c:otherwise>
														<c:url value="/result/${tagStatus.index}" var="url" />
														<a href='<c:out value="${url}" />'>${tagStatus.index}</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<%-- Show Next as link if not on last page --%>
												<c:when test="${itemsPageList.lastPage}">
													<span>Next</span>
												</c:when>
												<c:otherwise>
													<c:url value="/result/next" var="url" />
													<a href='<c:out value="${url}" />'>Next</a>
												</c:otherwise>
											</c:choose>
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

</body>

</html>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html lang="en">
<head>
<title>Git Hub API Tool</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vivify.min.css">

<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/site.min.css">

</head>

<body class="theme-cyan font-montserrat">

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


<div class="auth-main particles_js">

    <div class="auth_div vivify popIn">
        <div class="card">
            <div class="card-header" style="padding: 0px;">
                                        <div class="card-heading align-self-center" style="margin: 0px auto;width: 200px;">
                                          <img src="/assets/images/Yantriks-Logo.png" class="img-fluid logo-mobile" alt="logo" style="max-width: 200px">
                                        </div>
                                    </div>
            <div class="body">
                <p class="lead">Login to your account</p>
                <form:form method="post"  action="${pageContext.request.contextPath}/api/login/validate">
                 <label style="color: red; font-size: 18px;" class="lead">${status}</label>
                    <div class="form-group">
                        <label for="signin-email" class="control-label sr-only">Username</label>
                        <input type='text' class="form-control " id="signin-email" value="" name="username" placeholder="Username" onfocus="this.removeAttribute('readonly');">
                    </div>
                    <div class="form-group">
                        <label for="signin-password" class="control-label sr-only">Password</label>
                        <input type="password" class="form-control " id="signin-password" name="password" value="" placeholder="Password" onfocus="this.removeAttribute('readonly');">
                    </div>
                     <div class="btngroup">
                      <input name="submit" type="submit"  class="btn btn-lg btn-primary" value="LOGIN" />
                   </div>
                   
                </form:form>
            </div>
        </div>
    </div>
    
</div>
<!-- END WRAPPER -->
    
<script src="${pageContext.request.contextPath}/assets/js/libscripts.bundle.js"></script>    
<script src="${pageContext.request.contextPath}/assets/js/vendorscripts.bundle.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/mainscripts.bundle.js"></script>
</body>

</html>

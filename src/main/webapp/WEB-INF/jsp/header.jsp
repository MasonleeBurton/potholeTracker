<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Pothole Tracker</title>
<c:url var="jQueryJs" value="/js/jquery.min.js" />
<c:url var="jqValidateJs" value="/js/jquery.validate.min.js" />
<c:url var="jqvAddMethJs" value="/js/additional-methods.min.js" />
<c:url var="jqTimeagoJs" value="/js/jquery.timeago.js" />
<c:url var="popperJs" value="/js/popper.min.js" />
<c:url var="bootstrapJs" value="/js/bootstrap.min.js" />
<c:url var="adminJs" value="/js/adminMenu.js" />

<c:url var="bootstrapCss" value="/css/bootstrap.min.css" />
<c:url var="siteCss" value="/css/site.css" />
<c:url var="headerCss" value="/css/header.css" />
<c:url var="footerCss" value="/css/footer.css" />
<c:url var="formCss" value="/css/form.css" />
<c:url var="menuCss" value="/css/hiddenMenu.css" />

<link rel="stylesheet" type="text/css" href="${bootstrapCss}">
<link rel="stylesheet" type="text/css" href="${siteCss}">
<link rel="stylesheet" type="text/css" href="${headerCss}">

<link rel="stylesheet" type="text/css" href="${formCss}">
<link rel="stylesheet" type="text/css" href="${menuCss}">
<link rel="stylesheet" type="text/css" href="${footerCss}">


<script src="${jQueryJs}"></script>
<script src="${jqValidateJs}"></script>
<script src="${jqvAddMethJs}"></script>
<script src="${jqTimeagoJs}"></script>
<script src="${popperJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${adminJs}"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("time.timeago").timeago();

		$("#logoutLink").click(function(event) {
			$("#logoutForm").submit();
		});

		var pathname = window.location.pathname;
		$("nav a[href='" + pathname + "']").parent().addClass("active");

	});
</script>

</head>
<body>

	<nav class="navbar navbar-expand navbar-dark pl-5">
		
		<a class="navbar-brand" href="#"> 
		<c:url var="homePageHref" value="/" /> 
		<c:url var="imgSrc" value="/img/pothole_icon.svg" />
		<a href="${homePageHref}">
		<img src="${imgSrc}" 
			class="img-fluid logo"
				style="height: 50px;" /></a>
		</a> 

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<c:url var="homePageHref" value="/" />
				<li class="nav-item"><a class="nav-link" href="${homePageHref}">Home</a></li>
				<c:url var="potholeListHref" value="/list" />
				<li class="nav-item"><a class="nav-link"
					href="${potholeListHref}">Pothole List</a></li>
				<c:url var="submitPotholePageHref" value="/submit" />
				<li class="nav-item"><a class="nav-link"
					href="${submitPotholePageHref}">Submit Pothole</a></li>
				<c:if test="${currentUser.role == 'employee'}">
					<c:url var="adminURL" value="/admin" />
					<li class="nav-item"><a class="nav-link" href="${adminURL}">Admin</a></li>
				</c:if>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${empty currentUser}">
						<c:url var="newUserHref" value="/users/new" />
						<li class="nav-item"><a class="nav-link"
							href="${newUserHref}">Sign Up</a></li>
						<c:url var="loginHref" value="/login" />
						<li class="nav-item"><a class="nav-link" href="${loginHref}">Log
								In</a></li>
					</c:when>
					<c:otherwise>
						<c:url var="logoutAction" value="/logout" />
						<form id="logoutForm" action="${logoutAction}" method="POST">
							<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
						</form>
						<li class="nav-item"><a id="logoutLink" class="nav-link"
							href="#">Log Out</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>

	<div class="imgBar">
		<c:url var="barImgSrc" value="/img/potholebar2.jpg" />
		<img src="${barImgSrc}" />
	</div>

	<div class="container">